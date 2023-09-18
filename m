Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5CA010E5
	for <linux-staging@lists.linux.dev>; Mon, 18 Sep 2023 16:43:15 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-32163c3ece5so53551f8f.1
        for <linux-staging@lists.linux.dev>; Mon, 18 Sep 2023 09:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695055394; x=1695660194; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=e85KhEdB/8L2KjMgrb/nt50KjNVE0e0jrLX/VqJL4Lg=;
        b=NB9rOC64D6F1TOvv+fsJELulPVMuYwTbW1utYT5Wk/Nw6L5bSoFfxG2xvWY3sZiBP3
         I4pbicu2sdSJaEo5ngJ9ERCkfg1W9mCEChYtssTTeF730rDZlR76gm6mPlDJKtXbrPt3
         3ojpGFheQR0sGN4EwVXmJXVdSUIkcz8zUamHS/WHrjiel/Hzoq0MvSKeXYWTvegkjbkG
         a8MnQBqK9ZoVbrW/c7aGAjsOUTGIqdx+NDwxlenMKmUBFOrJZNbU5skYjvcerv1LzSc4
         DIH0vSG/wctMf8xqm6AEA/gG+kz2gSKjaaL5/QR0Lbi4nlzo1sUIMUM7I6+/GnMA4DR8
         UZtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695055394; x=1695660194;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e85KhEdB/8L2KjMgrb/nt50KjNVE0e0jrLX/VqJL4Lg=;
        b=adi3egwIVAN8eZFjl/SzraWo/eyj0OMk0Rwznr+fHQqj4CCbIq7Ur7ktD8SqSoQvoh
         dBbfPqDeb/YyxmkF85HioVstmIM60S1hy+o4VtFfIHwg5isYpjVR6uE+DGxvN0uxpiwb
         BtpUqeC3aQmb1A3sU5lhIVNwdvE1VoE5dGMCC2qLL51SHrZCVH8ll6tc2qamKU1QnQgD
         EmQCo0h/zKcPNcZG2lcAmnmYoaGxaQ25XXXw/k9bsOUYUp+lu2uCAoEWYhQIBWIubaEF
         MpgMYtC+AMtl5BSfbtp80HVC1Vj+VgpsJ0+h06ggZt1/qLS4fZqNUtn3XV6OyaqzEFXg
         ZWOA==
X-Gm-Message-State: AOJu0YzI7xqqCPrGlpaSp7s5bBN8ajRYyX9fKSfKDyeXHuEhx1XYesZC
	gntC/akef4XMV1zViRjTErA=
X-Google-Smtp-Source: AGHT+IEGkpjzaTNNA4HPhAu0hboCH8oLTrTqtsXb5iWixZukeONcx4voT+ZkWj9F+tqJkcjyy79XBQ==
X-Received: by 2002:adf:ef88:0:b0:317:3d36:b2c1 with SMTP id d8-20020adfef88000000b003173d36b2c1mr7889626wro.7.1695055393996;
        Mon, 18 Sep 2023 09:43:13 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id q11-20020adff50b000000b0031c71693449sm13174527wro.1.2023.09.18.09.43.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Sep 2023 09:43:13 -0700 (PDT)
Date: Mon, 18 Sep 2023 18:43:10 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] staging: rtl8192e: Fix compiler warning truncated
 writing of iwe.u.name
Message-ID: <2caafb8628880570725385e87150c47689474fc4.1695054044.git.philipp.g.hortmann@gmail.com>
References: <cover.1695054044.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1695054044.git.philipp.g.hortmann@gmail.com>

iwe.u.name and proto_name have both 16 bytes of space. But when writing
to iwe.u.name the first 10 bytes are used by the fixed string
"IEEE802.11". Evaluating the code shows that only the following strings
can occur in proto_name: "N-24G", "g", "b", "bg". Therefore it is
sufficient to shorten proto_name to 6 bytes.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202309171733.Gl96cmYd-lkp@intel.com/
Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtllib_wx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8192e/rtllib_wx.c b/drivers/staging/rtl8192e/rtllib_wx.c
index e9469bfef3dd..a37250de7ba3 100644
--- a/drivers/staging/rtl8192e/rtllib_wx.c
+++ b/drivers/staging/rtl8192e/rtllib_wx.c
@@ -29,7 +29,7 @@ static inline char *rtl819x_translate_scan(struct rtllib_device *ieee,
 					   struct iw_request_info *info)
 {
 	char custom[MAX_CUSTOM_LEN];
-	char proto_name[IFNAMSIZ];
+	char proto_name[6];
 	char *pname = proto_name;
 	char *p;
 	struct iw_event iwe;
-- 
2.42.0

