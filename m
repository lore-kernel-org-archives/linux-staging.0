Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E348C7B
	for <linux-staging@lists.linux.dev>; Wed, 27 Apr 2022 15:32:08 +0000 (UTC)
Received: by mail-qk1-f175.google.com with SMTP id i2so1520954qke.12
        for <linux-staging@lists.linux.dev>; Wed, 27 Apr 2022 08:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=cyrolNltUUpbs4yZr4ZZ4cVcFuuThjMYIy0lsDeAp/M=;
        b=ga7PA3xJYU6LHhoM5kPggCpCEGKJ5eM6EcSGUEXJtH4FpksmzO2XBrq+/HeMYvYFj8
         X3BoK8dWB5ySh81Nftik79G1npYH1rdTU87BqwpYU6iRheaSm46R4tt+Tyd+S7WusV5m
         2280iBykRrNhWzK5CQQqzsqBE/sjQVg88IMabVMIz8rGHyKZjNplv8KS0P/oNK9cshYI
         niTk4ChR7fCfNGXiD6KVwZYcQSyWReXYe/PRoRKVM0L9GU1dw/z72QxGlS4nLHJKFs+N
         hKrAM2Rbj+1XmZpHMKsXQ1w0NaOZP7eMRS118X7QN0OoxCIKzTkWLU260dQfAn0CI70o
         7PoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=cyrolNltUUpbs4yZr4ZZ4cVcFuuThjMYIy0lsDeAp/M=;
        b=HinF1GwymJzUd+6IUAFAg4jjI96g5y6T4oXFwXiH3WX9Y7zXNc0wPNz3RUqjuvL24H
         jJ3tpKbdo+H/2H1tKl9VOo6QEt21Ou1oy2UvgBAXPqIOKJUNOAbHBCesvgE+keFmnVgc
         IRz+HuIU4wsUl4Hin5ng7pJI4KeguZkM/oBo+IFWzhPaCxe4fIZEQFbkKp6WFoKcp9gu
         0D/K0gN36SsdMfPP42ugh5lSXP2nTo26BbfT5bOGjqB0jSVQjJYQjqx3qdXIZ8qQFXuI
         3oirNKUefJTQoIi2KX2qpXmF5hOG2QRkm4HP6Jy2+SXyhR6hIn4L8b6NVzxR5iZdHTG/
         H78w==
X-Gm-Message-State: AOAM531+l6zARHS6HfiHyv6EN7Ybhbt8Kr53NmfHWbw/9REicm5fDWFD
	Rhi0WzUCv/HgWnrkGCBf/gE=
X-Google-Smtp-Source: ABdhPJzKwLjFN7Ly4bvVQUi+eZxIcuebllqbHq6gOW3POQq235Srnx5TCcRCVB9tKQ65UO6DO/3ZwQ==
X-Received: by 2002:a37:a853:0:b0:69f:7f28:d90f with SMTP id r80-20020a37a853000000b0069f7f28d90fmr4672410qke.385.1651073527688;
        Wed, 27 Apr 2022 08:32:07 -0700 (PDT)
Received: from jaehee-ThinkPad-X1-Extreme ([4.34.18.218])
        by smtp.gmail.com with ESMTPSA id x9-20020a05622a000900b002f37b3537eesm3085759qtw.1.2022.04.27.08.32.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Apr 2022 08:32:07 -0700 (PDT)
Date: Wed, 27 Apr 2022 11:32:03 -0400
From: Jaehee Park <jhpark1013@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	jhpark1013@gmail.com
Subject: [PATCH v2] staging: r8188eu: remove unused else condition
Message-ID: <20220427153203.GA503502@jaehee-ThinkPad-X1-Extreme>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

rtw_select_and_join_from_scanned_queue() cannot return '2' so this
else condition is unused. Remove this unnecessary else statement.

Suggested-by: Pavel Skripkin <paskripkin@gmail.com>
Signed-off-by: Jaehee Park <jhpark1013@gmail.com>
---
patch v2:
- fixed the patch message 

 drivers/staging/r8188eu/core/rtw_mlme.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme.c b/drivers/staging/r8188eu/core/rtw_mlme.c
index d422ce87ba7c..29b8b101180b 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme.c
@@ -723,9 +723,6 @@ void rtw_surveydone_event_callback(struct adapter	*adapter, u8 *pbuf)
 			s_ret = rtw_select_and_join_from_scanned_queue(pmlmepriv);
 			if (s_ret == _SUCCESS) {
 				_set_timer(&pmlmepriv->assoc_timer, MAX_JOIN_TIMEOUT);
-			} else if (s_ret == 2) { /* there is no need to wait for join */
-				_clr_fwstate_(pmlmepriv, _FW_UNDER_LINKING);
-				rtw_indicate_connect(adapter);
 			} else {
 				if (rtw_to_roaming(adapter) != 0) {
 					if (--pmlmepriv->to_roaming == 0 ||
-- 
2.25.1

