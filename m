Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DE5B38E5C8
	for <linux-staging@lists.linux.dev>; Wed,  4 Feb 2026 08:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770194694; cv=none; b=l/3FlQqxidzN7J9G5Hz6iG1rs5W0tbVHuEhxyl7E5uWvw2s992y4P7iJqiGar7zMWuOy4vUIFJ0QC50ywEwCQ5hyphmMsKldPgFhByjETJUna7BLFP6BdGTgwZLA0b9r96BGXesK2YA1Z9qD7CZ/tSUE7H3oF0ZgSztLO08VOdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770194694; c=relaxed/simple;
	bh=P5CxHLhP3j0t6pQwhrjMzvoOvZBDVdmHggY0P/jCq2w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ZDsR0BB6XUCB3F7iN+Yku+Xzkn0TefzPL8caJRTSbxxSoMD+nZyhgXO76RCL+IIxj6E5e51MsVLvbdyMdC27divq1MrC6lVwuqkHlPzAmM6hU74FZ1QpHIfQH1WYSb51wB1JEhRFdODsWfKAffPbtcrkOgvcgXEm13kKdLB4GDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=camkruthrim.com; spf=fail smtp.mailfrom=camkruthrim.com; dkim=pass (2048-bit key) header.d=camkruthrim-com.20230601.gappssmtp.com header.i=@camkruthrim-com.20230601.gappssmtp.com header.b=ACYN0WRr; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=camkruthrim.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=camkruthrim.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=camkruthrim-com.20230601.gappssmtp.com header.i=@camkruthrim-com.20230601.gappssmtp.com header.b="ACYN0WRr"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8220bd582ddso3947119b3a.2
        for <linux-staging@lists.linux.dev>; Wed, 04 Feb 2026 00:44:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=camkruthrim-com.20230601.gappssmtp.com; s=20230601; t=1770194694; x=1770799494; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JZcm9gr6ToAaZv+vzEgY7O4UMkWPrrv1fLB9WPiG6ok=;
        b=ACYN0WRrLu4ViJjdhAHcignLe1JNzJgMJpAffwkoKpChHnlu8HydXaduCrsEtJOhVH
         QcU1+5i5J+4ZZ0buAOIpxGdGyAjT7vpaCusx+pGqYCpWNZspnZcthI3j+uJ2CyWDxdV7
         DvmL/j+KI6t7KitDy6RbFje/+dfMzq9/od4SdjVKbdDEIUVXoScaxrfnIq0FuA3iwI6O
         r4PdVsxVP/ek+k7vZaPhRUbTsVi3PaIufz0A08iwPJZXmVGbNtv87hYNv11gcKRIPqIk
         zDI7rLHDrOMt686DwV2KPwypdKoVj04UEDYZsDaxwwVYFt5oPgCuHS5TN0mTfPjwBAHx
         jRAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770194694; x=1770799494;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JZcm9gr6ToAaZv+vzEgY7O4UMkWPrrv1fLB9WPiG6ok=;
        b=LCsA2cMHC+1injOlNcw0Kh4caAWRmS3gWqfR99EvG783CnnxbHsdofn+vC2yoxXvk0
         78TCJrJ6Dv/jAOOSs4IR5ASr+M7LSb5+6zzveCOuVNSQqL94+PQ5/nZIsXeStOW02C97
         fMG1mggopSv/qwuJxoSr2ITAQmqPBkWi9S+vM6BAY3lIi6ih1LdEVPD0LszIvC1azL/L
         z+i0jOmJuHIxmEHb5/Pjt9yeK9ozZDtgJn7VqZg6SZEhDh/sNGjvU/DpA00u8qpGxNef
         svIl2KlpJreRC2wopxVaDCoT3w8vhaIndF1aj+6TKpNoadKGfSuTPEZm7uQ2UN3i79mq
         BJPw==
X-Gm-Message-State: AOJu0YyJHp1qZuU9pdy4IjCforgLP2XN4R0Md3sI/QdN17/gPhCAqU3M
	4NstAA4ymCsDHgSjDWkIskEftoeZaZMXaGoWbrZxCr2tcOYnR47RO7r6rt0czGxSwgSTEvoTPhK
	0UmvP5Hj6lvkgRA9hPcw2UxGhZ3a9eTU6Jd6WVTkKp9wCksSa6GQHEJYjRtkSLAs=
X-Gm-Gg: AZuq6aJEI9QN0j4tu7+qPnCVHFdisbGsEJnssPh5RhFwwUyR+FfQeuetmsmI8HiA/mS
	kCGpyDwJzGVPEfRBEKqpUVi/hdNWU9V64oeGH5oqca5i2PqcEt9LEAMEVvaaerJ5qfyHvpzL2Pa
	DdAPav0L/Ech16B75OXg9/PfeKobGiVtjTOR/fohmu9rqif58UxPlAYznx5lWAgtFXsBJx82Ipg
	XEBHMhauWaMx0sZePdYXxAkwduly60z6xg4rayr/+TY02OtHOe0R8/mLOIsbB/y/XxeCN7mAE6K
	TIwuMrSFsJcog2Az5MHcXU6Y+ZP2cVcBsI8ZqfkZe9akaoKKmWoEhlHr+aD1sbuXlCkg3wAzEqA
	IbUymR9vW+7+47UuvhRR0pcdx19jdAlVaBY/ZFRG+iMXwQHx+mAUQGXvPccSGiSVOMotCmFftTV
	jqaCE2jDC2ZRo5CobH0nqm/+8CcCTlnXAC0O0vObfo3qqpGnbYKvZN+kiN4KY6e2JtZwM98J8Vl
	SqJaKwUDwS2xdoaxRQEX1meEhJDfU4yehx84gObu7wUmj/0puYnNotW
X-Received: by 2002:a05:6a00:4395:b0:81c:717b:9d38 with SMTP id d2e1a72fcca58-8241c649fc2mr2241463b3a.47.1770194693741;
        Wed, 04 Feb 2026 00:44:53 -0800 (PST)
Received: from opensource206.domain_not_set.invalid ([103.186.255.90])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8241d163fa5sm1870889b3a.3.2026.02.04.00.44.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 00:44:53 -0800 (PST)
From: Pavan Bobba <pavanbobba@camkruthrim.com>
To: gregkh@linuxfoundation.org,
	trohan2000@gmail.com,
	davidzalman.101@gmail.com,
	bqn9090@gmail.com,
	hansg@kernel.org,
	straube.linux@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Pavan Bobba <pavanbobba@camkruthrim.com>
Subject: [PATCH] staging:rtl8723bs: Replace camel case rtw_btcoex_MediaStatusNotify with sneak case
Date: Wed,  4 Feb 2026 14:14:45 +0530
Message-ID: <20260204084445.7752-1-pavanbobba@camkruthrim.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Replace rtw_btcoex_MediaStatusNotify with rtw_btcoex_media_status_notify
as reported by checkpatch.pl

Signed-off-by: Pavan Bobba <pavanbobba@camkruthrim.com>
---
 drivers/staging/rtl8723bs/core/rtw_ap.c           | 2 +-
 drivers/staging/rtl8723bs/core/rtw_btcoex.c       | 2 +-
 drivers/staging/rtl8723bs/core/rtw_cmd.c          | 4 ++--
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c     | 2 +-
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 2 +-
 drivers/staging/rtl8723bs/include/rtw_btcoex.h    | 2 +-
 6 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8=
723bs/core/rtw_ap.c
index e1f76612c96c..06b230ba60ef 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
@@ -2114,5 +2114,5 @@ void stop_ap_mode(struct adapter *padapter)
=20
 	rtw_free_mlme_priv_ie_data(pmlmepriv);
=20
-	rtw_btcoex_MediaStatusNotify(padapter, 0); /* disconnect */
+	rtw_btcoex_media_status_notify(padapter, 0); /* disconnect */
 }
diff --git a/drivers/staging/rtl8723bs/core/rtw_btcoex.c b/drivers/staging/=
rtl8723bs/core/rtw_btcoex.c
index f4b19ef7b341..992f27e54588 100644
--- a/drivers/staging/rtl8723bs/core/rtw_btcoex.c
+++ b/drivers/staging/rtl8723bs/core/rtw_btcoex.c
@@ -8,7 +8,7 @@
 #include <rtw_btcoex.h>
 #include <hal_btcoex.h>
=20
-void rtw_btcoex_MediaStatusNotify(struct adapter *padapter, u8 media_statu=
s)
+void rtw_btcoex_media_status_notify(struct adapter *padapter, u8 media_sta=
tus)
 {
 	if ((media_status =3D=3D RT_MEDIA_CONNECT)
 		&& (check_fwstate(&padapter->mlmepriv, WIFI_AP_STATE) =3D=3D true)) {
diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl=
8723bs/core/rtw_cmd.c
index ef2d92b5588a..ccbd24031d2f 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -1285,11 +1285,11 @@ void lps_ctrl_wk_hdl(struct adapter *padapter, u8 l=
ps_ctrl_type)
 		/*  Reset LPS Setting */
 		pwrpriv->LpsIdleCount =3D 0;
 		rtw_hal_set_hwreg(padapter, HW_VAR_H2C_FW_JOINBSSRPT, (u8 *)(&mstatus));
-		rtw_btcoex_MediaStatusNotify(padapter, mstatus);
+		rtw_btcoex_media_status_notify(padapter, mstatus);
 		break;
 	case LPS_CTRL_DISCONNECT:
 		mstatus =3D 0;/* disconnect */
-		rtw_btcoex_MediaStatusNotify(padapter, mstatus);
+		rtw_btcoex_media_status_notify(padapter, mstatus);
 		LPS_Leave(padapter, "LPS_CTRL_DISCONNECT");
 		rtw_hal_set_hwreg(padapter, HW_VAR_H2C_FW_JOINBSSRPT, (u8 *)(&mstatus));
 		break;
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/stagin=
g/rtl8723bs/core/rtw_mlme_ext.c
index ac49bfbaa5bb..0ff730abb743 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -5201,7 +5201,7 @@ u8 setopmode_hdl(struct adapter *padapter, u8 *pbuf)
 	if (psetop->mode =3D=3D Ndis802_11APMode) {
 		/*  Do this after port switch to */
 		/*  prevent from downloading rsvd page to wrong port */
-		rtw_btcoex_MediaStatusNotify(padapter, 1); /* connect */
+		rtw_btcoex_media_status_notify(padapter, 1); /* connect */
 	}
=20
 	return H2C_SUCCESS;
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/st=
aging/rtl8723bs/hal/rtl8723b_hal_init.c
index 054e2c2eab02..4ce333e64df2 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -2432,7 +2432,7 @@ void SetHwReg8723B(struct adapter *padapter, u8 varia=
ble, u8 *val)
 			break;
 		case 2:
 			/*  sta add event callback */
-/* 				rtw_btcoex_MediaStatusNotify(padapter, RT_MEDIA_CONNECT); */
+/* 				rtw_btcoex_media_status_notify(padapter, RT_MEDIA_CONNECT); */
 			break;
 		}
 		break;
diff --git a/drivers/staging/rtl8723bs/include/rtw_btcoex.h b/drivers/stagi=
ng/rtl8723bs/include/rtw_btcoex.h
index 19764c80b8ba..97622c8572c3 100644
--- a/drivers/staging/rtl8723bs/include/rtw_btcoex.h
+++ b/drivers/staging/rtl8723bs/include/rtw_btcoex.h
@@ -15,7 +15,7 @@
 #define	PACKET_ARP				2
 #define	PACKET_EAPOL			3
=20
-void rtw_btcoex_MediaStatusNotify(struct adapter *, u8 mediaStatus);
+void rtw_btcoex_media_status_notify(struct adapter *, u8 mediaStatus);
 void rtw_btcoex_HaltNotify(struct adapter *);
=20
 /*  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D */
--=20
2.43.0


--=20


Regards,

Pavan Bobba

Founder & Lead Embedded Systems Engineer

CamKruthrim Solutions (GVSAPP =E2=80=93 Beyond Pixels)

=F0=9F=93=9E +91 94426 75099

=F0=9F=93=A7=20
pavanembedded6@gmail.com | gvsapp_solutions@camkruthrim.com

=F0=9F=8C=90=20
https://camkruthrim.com
