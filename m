Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2DE22C9C
	for <linux-staging@lists.linux.dev>; Tue,  7 Mar 2023 08:50:10 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id j11so29759736edq.4
        for <linux-staging@lists.linux.dev>; Tue, 07 Mar 2023 00:50:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678179009;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mBfKXBJBDHVK+Yn8iTiZud/hY3U7WgMo73YMptZicWs=;
        b=TOAuHtZjM3Ijc0PfNTcNtMrGRTmPJYiEm1CvHah72QXea4yC2xxYX1TNeuMNhRIGkj
         +lUwq3preMtRpKrJlkkuetb2G69HAiO1Ryr9AFLiFbY1LCEFiYzWyAyWYn8T6Bi0taRK
         bh+2KKVrQVXqPzbaQZyUdn9XD7X6QJL/5op9mBP93ruy+K0PSWhSOJpdOosJyfyA8yUN
         WMoYmuclPwU2wGd0UJhoTPt7NJ1R7pNTSr1FMW2a7SESYAGIFm5ahgK7vRuDa8v7RUM9
         stZoT83PLOeNfrytDNfQtSps3HuXvxa+OQOR7jNWSs2Cq0S2Gx8jCJj/Yzgw5yM5cwkN
         zmgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678179009;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mBfKXBJBDHVK+Yn8iTiZud/hY3U7WgMo73YMptZicWs=;
        b=z08DURkKUmgZMn3UjLJuwRvNywB4ddi9wNLnlSOpu2tREULfLItBUd5cpSb07LK9mU
         vAFhPlNOJGHGt0OWzzirTiRux8oSP8XpccNqnG8D1BJ6PU5/HBGRgCy9nJfvzS3ewYEY
         It7c+6cAjZ5pJI0UmAJld6/TEjpaiRIIOzdDDRTianEeOAqwCj5G30R0d0NkxMFU449d
         nx0+aDSsoXOYVbMFF7rOj6YrZRnmy5nbtDc/wyUwavGhIkr0kj8ehbJNooYyExAV/T4b
         M/zcUIN3Xou2IGy7FZFfwb6JjXkGou6dB1ak4IHJYAY/ujRcy8blunbaBYUh7ROMOosP
         oVvg==
X-Gm-Message-State: AO0yUKWbXpijtc90BXy76kZyaUJdu9nc3EPS3TaedE1IdDxhRIYjfda3
	YGNUCi3IekLyayY5lcChdCM=
X-Google-Smtp-Source: AK7set+d7BQhzAjk+VOU4jNGvOWZM9Pq8YoLYabn9OR+7Wyszv3kiRx9jH4I00B7UWgnMuD2/MYQNQ==
X-Received: by 2002:a17:907:8691:b0:8b1:3009:536b with SMTP id qa17-20020a170907869100b008b13009536bmr16987639ejc.29.1678179009200;
        Tue, 07 Mar 2023 00:50:09 -0800 (PST)
Received: from localhost.localdomain (ip5f5abbe7.dynamic.kabel-deutschland.de. [95.90.187.231])
        by smtp.gmail.com with ESMTPSA id o21-20020a170906289500b008ef42f9cf48sm5707402ejd.82.2023.03.07.00.50.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 00:50:09 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 2/2] staging: r8188eu: bgrpkey_handshake is set but never used
Date: Tue,  7 Mar 2023 09:50:03 +0100
Message-Id: <20230307085003.5025-3-straube.linux@gmail.com>
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

The field bgrpkey_handshake of struct security_priv is set but never
used. Remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_mlme.c        | 1 -
 drivers/staging/r8188eu/include/rtw_security.h | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme.c b/drivers/staging/r8188eu/core/rtw_mlme.c
index fb7d0e161fdd..809ac0317db2 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme.c
@@ -944,7 +944,6 @@ static struct sta_info *rtw_joinbss_update_stainfo(struct adapter *padapter, str
 		if (padapter->securitypriv.dot11AuthAlgrthm == dot11AuthAlgrthm_8021X) {
 			padapter->securitypriv.binstallGrpkey = false;
 			padapter->securitypriv.busetkipkey = false;
-			padapter->securitypriv.bgrpkey_handshake = false;
 			psta->ieee8021x_blocked = true;
 			psta->dot118021XPrivacy = padapter->securitypriv.dot11PrivacyAlgrthm;
 			memset((u8 *)&psta->dot118021x_UncstKey, 0, sizeof(union Keytype));
diff --git a/drivers/staging/r8188eu/include/rtw_security.h b/drivers/staging/r8188eu/include/rtw_security.h
index 783ae18a122a..8c187de7a522 100644
--- a/drivers/staging/r8188eu/include/rtw_security.h
+++ b/drivers/staging/r8188eu/include/rtw_security.h
@@ -116,7 +116,6 @@ struct security_priv {
 	u8	binstallGrpkey;
 	u8	busetkipkey;
 	u8	bcheck_grpkey;
-	u8	bgrpkey_handshake;
 	s32	sw_encrypt;/* from registry_priv */
 	s32	sw_decrypt;/* from registry_priv */
 	s32	hw_decrypted;/* if the rx packets is hw_decrypted==false,i
-- 
2.39.2

