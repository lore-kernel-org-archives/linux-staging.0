Received: from mail-41104.protonmail.ch (mail-41104.protonmail.ch [185.70.41.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5937570
	for <linux-staging@lists.linux.dev>; Thu, 13 May 2021 16:16:48 +0000 (UTC)
Received: from mail-03.mail-europe.com (mail-0301.mail-europe.com [188.165.51.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by mail-41104.protonmail.ch (Postfix) with ESMTPS id 4FgxVG3sxrz5XGK1
	for <linux-staging@lists.linux.dev>; Thu, 13 May 2021 16:11:18 +0000 (UTC)
Authentication-Results: mail-41104.protonmail.ch;
	dkim=pass (2048-bit key) header.d=bryanbrattlof.com header.i=@bryanbrattlof.com header.b="k/nAz7fN"
Date: Thu, 13 May 2021 16:10:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bryanbrattlof.com;
	s=protonmail3; t=1620922262;
	bh=xJHsGfB9Cd/p1CC6sw8uwkPBdkmkm1kg3OsjLFWhpGo=;
	h=Date:To:From:Cc:Reply-To:Subject:From;
	b=k/nAz7fNmy5/iAyOgBL++FolfI7K6PWOWuOFkxktk4jKVAFIf1scbJ+NAOmcC79AS
	 HVHJjB4wdFpB7nF1Rsb102Z+/TlE++LPEjAwNUqwv8narndP9QLXcByuXCZ9fCGPMu
	 5GJhL/5bhBdPUAp1JubyUQ9lXVKRlKzyGIujOM3YS4DGJi34/ffoK1BHdKwJKHL7oV
	 yyT1ayep/cyYvonioG/D1mQv8MKDgHhWwxb4q6pXkLQa3bmD+p1T4IHGzPT3tla+LK
	 HjWb1HKj9PeFB/LddJ7NEIAeLTPqQbO/i3OsbUJ4rOcT1z+dPTt0bbHOa0gDJ48HXj
	 VtB8XyxUBZvug==
To: Hans de Goede <hdegoede@redhat.com>, Larry Finger <Larry.Finger@lwfinger.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
From: Bryan Brattlof <hello@bryanbrattlof.com>
Cc: Bryan Brattlof <hello@bryanbrattlof.com>, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Reply-To: Bryan Brattlof <hello@bryanbrattlof.com>
Subject: [PATCH] staging: rtl8723bs: remove unused argument 'msg'
Message-ID: <20210513160848.1057564-1-hello@bryanbrattlof.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
	autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
	mailout.protonmail.ch

After the removal of the DBG_871X macros, the 'msg' argument
for rtw_sctx_wait() is no longer used.

Signed-off-by: Bryan Brattlof <hello@bryanbrattlof.com>
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c      | 2 +-
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 2 +-
 drivers/staging/rtl8723bs/core/rtw_xmit.c     | 4 ++--
 drivers/staging/rtl8723bs/include/rtw_xmit.h  | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl=
8723bs/core/rtw_cmd.c
index 3ed996bba98e..ac289e5600b0 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -693,7 +693,7 @@ int rtw_startbss_cmd(struct adapter  *padapter, int fla=
gs)
 =09=09res =3D rtw_enqueue_cmd(pcmdpriv, pcmd);

 =09=09if (res =3D=3D _SUCCESS && (flags & RTW_CMDF_WAIT_ACK)) {
-=09=09=09rtw_sctx_wait(&sctx, __func__);
+=09=09=09rtw_sctx_wait(&sctx);
 =09=09=09if (mutex_lock_interruptible(&pcmdpriv->sctx_mutex) =3D=3D 0) {
 =09=09=09=09if (sctx.status =3D=3D RTW_SCTX_SUBMITTED)
 =09=09=09=09=09pcmd->sctx =3D NULL;
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/stagin=
g/rtl8723bs/core/rtw_mlme_ext.c
index c5430e737bb1..ab68ef608620 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -2137,7 +2137,7 @@ s32 dump_mgntframe_and_wait(struct adapter *padapter,=
 struct xmit_frame *pmgntfr
 =09ret =3D rtw_hal_mgnt_xmit(padapter, pmgntframe);

 =09if (ret =3D=3D _SUCCESS)
-=09=09ret =3D rtw_sctx_wait(&sctx, __func__);
+=09=09ret =3D rtw_sctx_wait(&sctx);

 =09spin_lock_irqsave(&pxmitpriv->lock_sctx, irqL);
 =09pxmitbuf->sctx =3D NULL;
diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rt=
l8723bs/core/rtw_xmit.c
index 7e3477a45a0f..f21a814c7394 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -2505,7 +2505,7 @@ void rtw_sctx_init(struct submit_ctx *sctx, int timeo=
ut_ms)
 =09sctx->status =3D RTW_SCTX_SUBMITTED;
 }

-int rtw_sctx_wait(struct submit_ctx *sctx, const char *msg)
+int rtw_sctx_wait(struct submit_ctx *sctx)
 {
 =09int ret =3D _FAIL;
 =09unsigned long expire;
@@ -2546,7 +2546,7 @@ int rtw_ack_tx_wait(struct xmit_priv *pxmitpriv, u32 =
timeout_ms)
 =09pack_tx_ops->timeout_ms =3D timeout_ms;
 =09pack_tx_ops->status =3D RTW_SCTX_SUBMITTED;

-=09return rtw_sctx_wait(pack_tx_ops, __func__);
+=09return rtw_sctx_wait(pack_tx_ops);
 }

 void rtw_ack_tx_done(struct xmit_priv *pxmitpriv, int status)
diff --git a/drivers/staging/rtl8723bs/include/rtw_xmit.h b/drivers/staging=
/rtl8723bs/include/rtw_xmit.h
index e45753d17313..676ead0372fa 100644
--- a/drivers/staging/rtl8723bs/include/rtw_xmit.h
+++ b/drivers/staging/rtl8723bs/include/rtw_xmit.h
@@ -234,7 +234,7 @@ enum {


 void rtw_sctx_init(struct submit_ctx *sctx, int timeout_ms);
-int rtw_sctx_wait(struct submit_ctx *sctx, const char *msg);
+int rtw_sctx_wait(struct submit_ctx *sctx);
 void rtw_sctx_done_err(struct submit_ctx **sctx, int status);
 void rtw_sctx_done(struct submit_ctx **sctx);

--
2.27.0


