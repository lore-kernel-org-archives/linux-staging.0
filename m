Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD003446BC
	for <linux-staging@lists.linux.dev>; Sat, 20 Jun 2026 23:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781998885; cv=pass; b=VfBwK/JR0kXcVE2KHGf3Dv3R7iS0RaCkiRhiXtxqnbg6dXD5lgEnzXyrGwwBeIdKCAanGH89TXNLm+neGbnC81GtO9d1vr0v9VkIVheXJQXfqV0/oIETNP7EMlbFGsir0RLfJ5NabzjStvhExKDh2NPQpbxYFuvqIECGZfIHax8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781998885; c=relaxed/simple;
	bh=82Kf3JgIJQ0G8lBaGmDY/EraGV4DeuRCaTvGeRY/6PM=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=Aw3F2lmeK8hNRtUtMbQXZ46RDR+2ypPawnbotlvTF6+FY17gU5o9lzARJh+px3vLNiL2hDnPMSIoP24T1Hyp4zpKhl/rWpc8Ar3xCHncoZr0Hmzb4v4hEj9USkokJGu2puflBnLai7aOe1CChV4INTRX+lmMbKyN4C3O937GZVc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sevf7olF; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sevf7olF"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6978f1eebb2so232733a12.3
        for <linux-staging@lists.linux.dev>; Sat, 20 Jun 2026 16:41:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781998881; cv=none;
        d=google.com; s=arc-20240605;
        b=LMdAFc54K4ioIf71bR9SQ75jyu5A906oYu7Fy7xcpE7nLDph9YHq6ZYyVXvi2IW/qb
         vnEzUSwCjHMEcPsfx77gs/mpNvs4witoXgaMAmF77eeVhj8AhIjWjLr5g6tIYs1BQVcJ
         dZ13jPqiOhaIYQTe22nB/Wloye4DZqAynjqQzf5FpBbjVaMCHTi+NEpy2ohQN92GeFrO
         LZ0C+KG8u+TPz1YntE85dUGzViyFJvNiCJzJqkR7m7WAxZN9J9kgpGa1K2lEafktjXEU
         Qc6vuXAikKU85ppEyZnbWwLgzbOQYtSKDxsQCGU6XAUKnP80rowGyW5GsW6nqkfgpyGp
         TxPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=YUxhTabwX8U7GIbEqGU5o33Gedfu7E6KTuPA7JrKzlM=;
        fh=bpAJ5YsbjdJ/l8BcgsSmWhASFMT310mtt1pJeEDcPEs=;
        b=ErF0Dwn56qE+8kOqlN4dl2P0HLnWstfkcC4TZIajR4ACswkOzbH5bL0b1asjj4+/Yu
         +s3rpnZrZ1gqKQlB5GlBi4WMJmva3qRHyeQ+ItOp4Zyo+7+CTSsIwpDQjKizvEno17iP
         5jpGrq3sw7RXCHNwiyxmwADlube4SUbVNcmLAZLaJ42jGHwo/N3/EcsR0qFmq8KtHOHS
         Zcw3ukkLnTK1eWTBRSoqqZ2974ruSaVCIcE9wIhWSDPG56OW1cbrOSDIIraff9GmmMva
         vTEgoCsxTa8XPiL5tIlO8IPl5FHySnx6h3eCTfLj+Et+/oCi7ip0+K1UvGHTw5qx0nfx
         +G6g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781998881; x=1782603681; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YUxhTabwX8U7GIbEqGU5o33Gedfu7E6KTuPA7JrKzlM=;
        b=sevf7olFRfBnkqdV9a6QuTvoKRCbrmDDxNaQlfCPujArkhcPGs7lxOtHjP3QHY3pnI
         DBtJOoXJvebcgmFhO7Pxf1YPDBu9x7aKMI6F8IiFlbgFEqFOXReW9/WI1EptrbTO0iWX
         iaRRPnRNtqeC/JgO4qR0jBL1HGs/Yj4Ed5vy3/unSpJUk0iywuqKU4jJ+zOZucwDw4hK
         38ZqfzeLtVR+kFFcmC3OOzP+fUQXCe1kTT0B8idVlvYBpBuiR3XdDCZ+h2LoWm2VpeLp
         LtjrNGr54YFmVJuZvYv37AJpk+SwJbKmbYmi/b5GKq9/bxSiTOZJznCTO+jWDs5ViHdO
         3Z4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781998881; x=1782603681;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YUxhTabwX8U7GIbEqGU5o33Gedfu7E6KTuPA7JrKzlM=;
        b=cynWkeYqi+JylqA8nN2/mFmpR6mpyo5Xoeg2nS9b5XzVklDBeqdehDIrD3FQsTLLmO
         VbTNWwtDrfVf3uRd5zBc6fsov5XXiOzVuA9Hh2tHzRrE8f7NZ5wj6ZPtoGSTqRiMhgTe
         tz5Mh2KY3tlqdJkdMlGRN+8mEjmKaOTk5jCTjzB5AXUF2xubyPY2RRGENWQZzOlUzNM8
         mx0xG8VMKRXWTxW2tbvm6h8pLWRTa8FgFjqmI+G6m6P3XXt1SvEX7GpN70yd5FoZYlKN
         iGKwJZfV7JcULUPXdsap7EbQ0w2HFKdEPj/WXYfleOB3/bU6VmEwC7NT7/Wq77Q4Q7Z6
         Rfnw==
X-Forwarded-Encrypted: i=1; AFNElJ9XZdFLmWFoPbJGQVNHRRuI4ftQlcXgcu1OkP8tZeyPlTuEjja7BhW2oJKU9UuwI+/j+Qy0uOOTKQL1H0TN@lists.linux.dev
X-Gm-Message-State: AOJu0Ywi6Ba7K+13AOBTl2OJDy7WA1KeZuDmLWXzlLdYsHc5dhljfXYV
	vX0svzFg8uD1BicWwU21Ve+N7eVLPpcPsje1qARqbPBkusfRjSb7+oNFfuqPIlcwYaE6EU3g5Ia
	WzrsQBF9f9mankAimSH4tFf0K4bFZJY4=
X-Gm-Gg: AfdE7cn/xp7E5bORVyx6hUp55/a2SFux+rxqmprupRfGD8z/pW+AZ3n2eScHnq6WpBb
	IHPFHjSkjvRr/wuNTZqee/5BrndGcBrfXLQiNPw4PxgKV/MWHiWD4L4FgyBw1DakBcbGT+jGuXk
	OVTwCq/VTuDGeGPxDbfNxZe4uPWJQiTA7Ji0rzEpaSwqP/uaQW/HTslP3LJXFgyAky7iArYCc7a
	GELpKf4AFbxo3Dct3mjXeSp4cenMJgTtneNryA8gdc8arE3ohWd8cGlsF9ZzgkvkA7ES9oaLrpz
	hUm8uSZWL0xs63r1I4YbO1ohA3nV
X-Received: by 2002:a17:906:fe4c:b0:beb:7b50:3a7b with SMTP id
 a640c23a62f3a-c097ae2c6c0mr430469166b.6.1781998880640; Sat, 20 Jun 2026
 16:41:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Saulo Henrique <saulohsdoroteio@gmail.com>
Date: Sat, 20 Jun 2026 20:41:12 -0300
X-Gm-Features: AVVi8Cc7s44tAXt6tJdrucDNkLBSUorns6oGdAqZiN9un9e1DZ8lpmD_Nbv02SA
Message-ID: <CAM09=pU-wLaqvizTt-pu595nSx2PRw8W60rraArTWRo8VFemRg@mail.gmail.com>
Subject: [PATCH] staging: rtl8723bs: fix checkpatch style issues
To: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

From 66175877cefddce1a2ea5ee2cffec427c05b21d2 Mon Sep 17 00:00:00 2001
From: =3D?UTF-8?q?Saulo=3D20Henrique=3D20Santos=3D20Dorot=3DC3=3DA9io?=3D
 <doroteios@outlook.com>
Date: Sat, 20 Jun 2026 19:29:24 -0300
Subject: [PATCH] staging: rtl8723bs: fix checkpatch style issues
MIME-Version: 1.0
Content-Type: text/plain; charset=3DUTF-8
Content-Transfer-Encoding: 8bit

Fix multiple coding styles issues reported by checkpatch.pl, including
line wrapping and whitespace cleanup.

Signed-off-by: Saulo Henrique Santos Dorot=C3=A9io <doroteios@outlook.com>
---
 drivers/staging/rtl8723bs/core/rtw_btcoex.c | 5 ++---
 drivers/staging/rtl8723bs/core/rtw_efuse.c | 4 ++--
 drivers/staging/rtl8723bs/core/rtw_ioctl_set.c | 14 +++++++-------
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 4 ++--
 4 files changed, 13 insertions(+), 14 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_btcoex.c
b/drivers/staging/rtl8723bs/core/rtw_btcoex.c
index 0191a943f..055ca95ff 100644
--- a/drivers/staging/rtl8723bs/core/rtw_btcoex.c
+++ b/drivers/staging/rtl8723bs/core/rtw_btcoex.c
@@ -10,8 +10,8 @@

 void rtw_btcoex_MediaStatusNotify(struct adapter *padapter, u8 media_statu=
s)
 {
- if ((media_status =3D=3D RT_MEDIA_CONNECT)
- && (check_fwstate(&padapter->mlmepriv, WIFI_AP_STATE) =3D=3D true)) {
+ if ((media_status =3D=3D RT_MEDIA_CONNECT) &&
+ (check_fwstate(&padapter->mlmepriv, WIFI_AP_STATE) =3D=3D true)) {
   rtw_hal_set_hwreg(padapter, HW_VAR_DL_RSVD_PAGE, NULL);
  }

@@ -65,7 +65,6 @@ void rtw_btcoex_LPS_Leave(struct adapter *padapter)
 {
  struct pwrctrl_priv *pwrpriv;

-
  pwrpriv =3D adapter_to_pwrctl(padapter);

  if (pwrpriv->pwr_mode !=3D PS_MODE_ACTIVE) {
diff --git a/drivers/staging/rtl8723bs/core/rtw_efuse.c
b/drivers/staging/rtl8723bs/core/rtw_efuse.c
index 099320e4e..fb3905cfd 100644
--- a/drivers/staging/rtl8723bs/core/rtw_efuse.c
+++ b/drivers/staging/rtl8723bs/core/rtw_efuse.c
@@ -76,8 +76,9 @@ u16 Address)
     break;
   }
   return rtw_read8(Adapter, EFUSE_CTRL);
- } else
+ } else {
   return 0xFF;
+ }

 } /* EFUSE_Read1Byte */

@@ -232,7 +233,6 @@ void EFUSE_ShadowMapUpdate(struct adapter
*padapter, u8 efuseType)
  /* void *)&pHalData->EfuseMap[EFUSE_INIT_MAP][0], mapLen); */
 } /* EFUSE_ShadowMapUpdate */

-
 /*------------------------------------------------------------------------=
-----
  * Function: EFUSE_ShadowRead
  *
diff --git a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
index c70541f95..fa79c1928 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
@@ -36,11 +36,11 @@ u8 rtw_do_join(struct adapter *padapter)
 {
  struct list_head *plist, *phead;
  u8 *pibss =3D NULL;
- struct mlme_priv *pmlmepriv =3D &(padapter->mlmepriv);
- struct __queue *queue =3D &(pmlmepriv->scanned_queue);
+ struct mlme_priv *pmlmepriv =3D &padapter->mlmepriv;
+ struct __queue *queue =3D &pmlmepriv->scanned_queue;
  u8 ret =3D _SUCCESS;

- spin_lock_bh(&(pmlmepriv->scanned_queue.lock));
+ spin_lock_bh(&pmlmepriv->scanned_queue.lock);
  phead =3D get_list_head(queue);
  plist =3D get_next(phead);

@@ -53,7 +53,7 @@ u8 rtw_do_join(struct adapter *padapter)
  pmlmepriv->to_join =3D true;

  if (list_empty(&queue->queue)) {
- spin_unlock_bh(&(pmlmepriv->scanned_queue.lock));
+ spin_unlock_bh(&pmlmepriv->scanned_queue.lock);
   _clr_fwstate_(pmlmepriv, _FW_UNDER_LINKING);

   /* when set_ssid/set_bssid for rtw_do_join(), but scanning queue is empt=
y */
@@ -74,7 +74,7 @@ u8 rtw_do_join(struct adapter *padapter)
  } else {
   int select_ret;

- spin_unlock_bh(&(pmlmepriv->scanned_queue.lock));
+ spin_unlock_bh(&pmlmepriv->scanned_queue.lock);
   select_ret =3D rtw_select_and_join_from_scanned_queue(pmlmepriv);
   if (select_ret =3D=3D _SUCCESS) {
    pmlmepriv->to_join =3D false;
@@ -84,7 +84,7 @@ u8 rtw_do_join(struct adapter *padapter)
     /* submit createbss_cmd to change to a ADHOC_MASTER */

     /* pmlmepriv->lock has been acquired by caller... */
- struct wlan_bssid_ex *pdev_network =3D &(padapter->registrypriv.dev_netwo=
rk);
+ struct wlan_bssid_ex *pdev_network =3D &padapter->registrypriv.dev_networ=
k;

     pmlmepriv->fw_state =3D WIFI_ADHOC_MASTER_STATE;

@@ -151,7 +151,7 @@ u8 rtw_set_802_11_ssid(struct adapter *padapter,
struct ndis_802_11_ssid *ssid)
  else if (check_fwstate(pmlmepriv, _FW_UNDER_LINKING) =3D=3D true)
   goto release_mlme_lock;

- if (check_fwstate(pmlmepriv, _FW_LINKED|WIFI_ADHOC_MASTER_STATE) =3D=3D t=
rue) {
+ if (check_fwstate(pmlmepriv, _FW_LINKED | WIFI_ADHOC_MASTER_STATE) =3D=3D=
 true) {
   if ((pmlmepriv->assoc_ssid.ssid_length =3D=3D ssid->ssid_length) &&
       (!memcmp(&pmlmepriv->assoc_ssid.ssid, ssid->ssid, ssid->ssid_length)=
)) {
    if (check_fwstate(pmlmepriv, WIFI_STATION_STATE) =3D=3D false) {
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c
b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 9f21a2226..84314b7f6 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -342,8 +342,8 @@ bool rtw_is_same_ibss(struct adapter *adapter,
struct wlan_network *pnetwork)

 inline int is_same_ess(struct wlan_bssid_ex *a, struct wlan_bssid_ex *b)
 {
- return (a->ssid.ssid_length =3D=3D b->ssid.ssid_length)
- && !memcmp(a->ssid.ssid, b->ssid.ssid, a->ssid.ssid_length);
+ return (a->ssid.ssid_length =3D=3D b->ssid.ssid_length) &&
+ !memcmp(a->ssid.ssid, b->ssid.ssid, a->ssid.ssid_length);
 }

 int is_same_network(struct wlan_bssid_ex *src, struct wlan_bssid_ex
*dst, u8 feature)
--=20
2.47.3
