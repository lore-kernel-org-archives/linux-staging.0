Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91DE53FCC
	for <linux-staging@lists.linux.dev>; Fri, 24 Sep 2021 12:27:44 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id x7so20898919edd.6
        for <linux-staging@lists.linux.dev>; Fri, 24 Sep 2021 05:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+O516dRas0PleKnQD2Ngp8BTWaQ5AdYStSXmf67/51c=;
        b=RtfMfEtoc9sHbAx/ZVBLjlg1CQGZwKVTszV6qxZwAdwOtCWRnSZi/JlHlqgQBb/vzH
         4u2pk3bxCBYx8iGx+iWW95PGUBfLUPnGnIJfdaXAPOQ8KQ5CLaBTbl/ltUb3FTQGS6Bd
         axFGHtIL36mESmeHItqsciFUmvr3DatTon8OCmsTCBaf84uCA7nlhNrDZBpIJ2FBK2SV
         5F2a0aBcmAnI1igFM9npwuwrV6v5u8eAC9zjR2SNICM8NCBTM+Ks3KtcceZ/SaxJAgzs
         TPKhVzoh2ZhtmzDNf2+vuLrtIBpp5Wuh2/UXxcKkfii7bTC+/dFk1RFa8xNFAnk3btFP
         qIQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+O516dRas0PleKnQD2Ngp8BTWaQ5AdYStSXmf67/51c=;
        b=CiVbhoPCTmQWmp92BrMtp4yUnW28mzaBkGYaoXN7fsnTJPQGQzVq5eDfr3X50GB9d9
         CNyLbiZ5HGfLRydBJExLwEttgP1JNfHGezNLT3sD6thhfIP9dJuXWGwgVoT6ygUB3D8S
         WwyinPPS0I80NUuoBsXJFnQzE1AcnzD7BUOCoYv6gCrhk4TW+ZDgx5irjXRSosZhNWIi
         iTafDa7Qbt/DUUOStX5xp5Wf2hxxexo7uj8VS3FSevrYfKB4wP+LGMPJA+zJBJ75wh/y
         Ry69GP3848fvmzZvyzgK0BF3jlAXzqPhkrhP8g1LyOpFTGE6DlrpzAcJJSSDSav59vCW
         bGNA==
X-Gm-Message-State: AOAM532YrWKYsw6skFDUhBu6zTeq4qOR4jgfYopXtwwCDPcPJ5VdQ6O4
	7HY6JRz8Ts+CALNHRMzO7I8=
X-Google-Smtp-Source: ABdhPJws4kNyOu+0DEn2hN6VhHtSvSSEgFp4gED2OAHfh4c/8aZWo6rF2U52NmhgD1MASOpXvwkWPA==
X-Received: by 2002:a17:906:3b53:: with SMTP id h19mr10809575ejf.109.1632486462848;
        Fri, 24 Sep 2021 05:27:42 -0700 (PDT)
Received: from localhost.localdomain.it (host-212-171-30-160.retail.telecomitalia.it. [212.171.30.160])
        by smtp.gmail.com with ESMTPSA id v13sm4882522ejh.62.2021.09.24.05.27.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Sep 2021 05:27:42 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	David Laight <david.Laight@aculab.com>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Michael Straube <straube.linux@gmail.com>,
	Martin Kaiser <martin@kaiser.cx>
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [PATCH v10 12/16] staging: r8188eu: Remove a test from usbctrl_vendorreq()
Date: Fri, 24 Sep 2021 14:27:01 +0200
Message-Id: <20210924122705.3781-13-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210924122705.3781-1-fmdefrancesco@gmail.com>
References: <20210924122705.3781-1-fmdefrancesco@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove an unnecessary 'if' test from usbctrl_vendorreq() because
"length" is never greater than MAX_VENDOR_REQ_CMD_SIZE.

Co-developed-by: Pavel Skripkin <paskripkin@gmail.com>
Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---
 drivers/staging/r8188eu/hal/usb_ops_linux.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/usb_ops_linux.c b/drivers/staging/r8188eu/hal/usb_ops_linux.c
index 04a878c1a87d..b3f8a76b5db2 100644
--- a/drivers/staging/r8188eu/hal/usb_ops_linux.c
+++ b/drivers/staging/r8188eu/hal/usb_ops_linux.c
@@ -23,12 +23,6 @@ static int usbctrl_vendorreq(struct intf_hdl *intf, u16 value, void *data, u16 l
 		goto exit;
 	}
 
-	if (len > MAX_VENDOR_REQ_CMD_SIZE) {
-		DBG_88E("[%s] Buffer len error ,vendor request failed\n", __func__);
-		status = -EINVAL;
-		goto exit;
-	}
-
 	mutex_lock(&dvobjpriv->usb_vendor_req_mutex);
 
 	/*  Acquire IO memory for vendorreq */
-- 
2.33.0

