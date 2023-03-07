Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82FE9291F
	for <linux-staging@lists.linux.dev>; Tue,  7 Mar 2023 08:50:10 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id ec29so18448114edb.6
        for <linux-staging@lists.linux.dev>; Tue, 07 Mar 2023 00:50:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678179008;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8GFQv4/Ns3Nfi73ZwFrLlp9/6YwSGNlJakq8RjW9OfI=;
        b=mb6HCoQdgbUdoTO5sLWloyZgOY6Jk+NIF6Xl+Vo94MFkonwtA5Wa0oHgbVAgC7dZSj
         TE2wxofcsK5scYjpqMTgAR75sspJKXjNqhPV7iSVkpmIQVpPIXa7TMIPCRERdp6CqFpL
         FLx8MG0xu0yUBb3bVfB05mvl8RbEShHyyVJd731fKm2bppuHH0NotaUSlV89VogZi9vY
         DK8ySsOBLrzyDyAiM/3RRVjWJ7abz1ikONmVXMseyzC25hsOXe6+sS5rmUAp8/lEf74d
         r69zEegsa27Z1jBpH0VC7uey4gbouSaBD3yOFVJeXXmP/rEyzTmxELiOmnou6QpnFxuz
         LK/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678179008;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8GFQv4/Ns3Nfi73ZwFrLlp9/6YwSGNlJakq8RjW9OfI=;
        b=Ax+x0oH8XAo9/MYxv6QOuxWWfWoOhhGWgABUz8d7Yp5IVzUWXBKXx053eU1tS/YP2X
         ErqMQJoCHjnpw0M9MwjH4f49oXUZwVN7+IblCEEU0y024TmSsQtZMRB++Xz755KxycD4
         5kSy/SmM16U3X2xLUmPY5TPUz7BNfRWwC4w8qvucg5ciBKP7z9LpQAPJAX02dRdywCPx
         HSXEHTkIClXEtqC/RatdcVYlJMT4XxaBgwrc+SAj0729gapW+bZMPX1ng17E57wzHfH2
         VJKqLbsAGel59z5YpL275YonBTBhP9hblvQYDIuhlxp7U81KtMtqJ1NLdZq9edN54XDj
         cAlA==
X-Gm-Message-State: AO0yUKXisbE3mWhdiDL+PVNSwkXWyJWitJB9S11TlkStLoto5HAAOeSU
	+PvH/jnQdp18Krv0iDkLkOU=
X-Google-Smtp-Source: AK7set/Zw8sivf7IxlWxAPdvgsvetEX53dZnC6qiHXJuYGjRPFNcTEuSL3FDBGusA0dQgUnQI15F3Q==
X-Received: by 2002:a17:906:dfca:b0:884:37fd:bf4c with SMTP id jt10-20020a170906dfca00b0088437fdbf4cmr12474897ejc.19.1678179008745;
        Tue, 07 Mar 2023 00:50:08 -0800 (PST)
Received: from localhost.localdomain (ip5f5abbe7.dynamic.kabel-deutschland.de. [95.90.187.231])
        by smtp.gmail.com with ESMTPSA id o21-20020a170906289500b008ef42f9cf48sm5707402ejd.82.2023.03.07.00.50.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 00:50:08 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 1/2] staging: r8188eu: busetkipkey is boolean
Date: Tue,  7 Mar 2023 09:50:02 +0100
Message-Id: <20230307085003.5025-2-straube.linux@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230307085003.5025-1-straube.linux@gmail.com>
References: <20230307085003.5025-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The field busetkipkey of struct security_priv is set to boolean
values only. Remove unneeded comparisions from if statements that
use this field.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_recv.c | 2 +-
 drivers/staging/r8188eu/core/rtw_xmit.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_recv.c b/drivers/staging/r8188eu/core/rtw_recv.c
index fc7568cf948b..741c17121c9b 100644
--- a/drivers/staging/r8188eu/core/rtw_recv.c
+++ b/drivers/staging/r8188eu/core/rtw_recv.c
@@ -471,7 +471,7 @@ static struct recv_frame *decryptor(struct adapter *padapter, struct recv_frame
 			break;
 		}
 	} else if (prxattrib->bdecrypted == 1 && prxattrib->encrypt > 0 &&
-		   (psecuritypriv->busetkipkey == 1 || prxattrib->encrypt != _TKIP_))
+		   (psecuritypriv->busetkipkey || prxattrib->encrypt != _TKIP_))
 			psecuritypriv->hw_decrypted = true;
 
 	if (res == _FAIL) {
diff --git a/drivers/staging/r8188eu/core/rtw_xmit.c b/drivers/staging/r8188eu/core/rtw_xmit.c
index df88b3e29e77..cc3894101673 100644
--- a/drivers/staging/r8188eu/core/rtw_xmit.c
+++ b/drivers/staging/r8188eu/core/rtw_xmit.c
@@ -626,7 +626,7 @@ static s32 update_attrib(struct adapter *padapter, struct sk_buff *pkt, struct p
 		pattrib->iv_len = 8;
 		pattrib->icv_len = 4;
 
-		if (padapter->securitypriv.busetkipkey == _FAIL) {
+		if (!padapter->securitypriv.busetkipkey) {
 			res = _FAIL;
 			goto exit;
 		}
-- 
2.39.2

