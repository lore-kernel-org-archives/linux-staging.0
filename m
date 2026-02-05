Received: from sonic307-21.consmr.mail.sg3.yahoo.com (sonic307-21.consmr.mail.sg3.yahoo.com [106.10.241.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C60B3AEF2C
	for <linux-staging@lists.linux.dev>; Thu,  5 Feb 2026 16:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=106.10.241.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770309236; cv=none; b=ddwBmVJKpch0u1mXH4osQpU0ZIZewHtd2T3BiC4XNsvwWSBbYTJ011OMQR+nk98mOyNfmAF+wJZD42/Hw8Rj184KRfiKwdP0SeLGQ/f+1HYDLsEMjgso4wP6BVDojpTel1oiYiHONqtSu0RXFg0Fy7B/nqYo5hch9+8M8L3zU3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770309236; c=relaxed/simple;
	bh=MubXJvUP1uLMz9lHjEuOnpq31j1ihbVVhNlTM/BtKIQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:References; b=FfQP4wzUtwDeajSz5RAyGK2avAMjC+qUxLWdRvUhHT57Ur1suxR2/zFJHMmS8/YWOh0c23PBkRWD4afXd9Cp6h3gtrDSpPskckM5G4bkDHD7j5nmh/Lnf8fl0P8eRxJw7ATtnPD0gJ8JUrV8dUjHrSJSUvFX9TtKM3r7uBm7+wA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com; spf=pass smtp.mailfrom=yahoo.com; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=MsFBWgNr; arc=none smtp.client-ip=106.10.241.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="MsFBWgNr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1770309234; bh=0ls0o9u5rZM1fX7wLjP7e+M7JzXYgn2xaii06rwPv1g=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=MsFBWgNrr7ZuHMBtWKZN7H6WwtEP9rwdr5HeRGRJYKLLD5eET5Lj+QG9wMl/GmiPBNlLiJ7rKiiOU+9MTZejF8aA81xWXA4b6pNb/zQh0udGWQPM6XGJ4rTlHxQAFEoiyIdVTYMVwun3rKOi7qHMkaOXVqcCo4HQlZ5htaYp0hn2WvxO+2VsJwRhcdEOE6/uphC8xRghhMa7nN2wrirYVApz6olo9NJ1FKRoT/rlfdX3j2FapRlEc9gGUv2TlabzdFG12tCH3B8uNHX8E5cGiDafHObV0K7y3abDntqsV07OSAoRJZpVGaoF9bUO4mJ2ahkP8BCQ+MVpmmNXoXtaJg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1770309234; bh=MDQaPd392OAikmMH0RR2t7XZPrL/1Z3Sk5oAAh65bwa=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=EIfpi2xnyx90wxC/TaEgI3TyvZWnVXy8Vzyb94z6LvXcWAD5yHFRtMBr3gw4e5EiSxg3Ard8I1e9BQ3lj6GEiPGZyOVv5A5fvDoHGHTK3+x6v1VZhQ6NkRz8Hf1ONTdfAl7zkrzs1j+a6KVo1xtqeQieqqHPDvOh4/skXp2K+sOS47/FNjy2CWchqRQ06oUiSMqAUfX7i5WhHqKvbi9viZey8tRlTGVe4sv643jhL1mX8hk5sagIs50TrNOvR5PIH0yy0uFn9L3DQ1lxwtcuUgjJegHF2wsnKNojvpXCA3vzKLqHCsH6eTd8TgX6UlUtdFxbcODdOgiysiLOxWNs6A==
X-YMail-OSG: QrExvyoVM1kEMrI6Aucpx_AkPxgwHrdNHbZyL5oVKi5WbQcoUxPhiVl.7fLnP5W
 bslQl0NNXMQIQkSh5OMRQwz95FbJ9PTP1BnKF4ZuyVoMzlb5ngP_11I48Or3OHL2Rz4cCHi_TgHq
 DXQBbGNMVeiZVOA3Z6hvx6eImowxTbekNIlK9aAA_oJypuAknyn.J58x.S.vD3A9XXC2IfI5Ul0_
 F3hl1lPUEORj35VvKfH167gZM86WFLxoJY3.ippXcYjycj78Rsqv8cjZ_hbduKp5XczvrZ3lyvYq
 g7JR9tflu_KDu3msSqxggE72hpKIAliHi2ZTEW2WLihXg_d7pE7FIbVK5xxwz_vZQmq8YrEKqXjQ
 rc6c.sL_C6qqj7gghYtmmJER1SyyyZ3B2wQovdC.n4gh330wnQ3XAqC6snXh8z4sKEVRipgzL6bH
 ROV0S11mA7YbdW1t.StfEvPxHaAarEedpbGBYYyZdKpcUOVKwOQv1r4qAh.48_ukHw2TB8.cWWgS
 e4F9k80p1DDjYwDXRM14t1CRP1Xh5mbz1e_k7UEMIrtxf5s3pTKsbKi9JxdAfvI9R3l6DDHK9ZvZ
 K3nquilTagjJpjWVgieM1XT3ocCPOKD2t8Y5VBaVZN8FoHu0z5nVfcZ7FtmpMc3Mz3hWkimLZBgn
 lniPNQXkJBvECYzlTzUkA2xqbjoeCjRZOTNSp_5ydGMhW51C10RKcV2Vbmvx756xm3oISWV3Fsxr
 DeG83Ds.tuRVKG3dDYz4FNnua3C5SpiB0nx..UcU_XbibOP7uULCZJJ31x36nmsBz4VHLtCO5Np2
 HIcQ2zvc_d0zbJ0CIuvCYVGBz5fsIfWjlQttqpHk5XpojqKG0klPf.2YScNnZNZf8FF_0lTaXy0H
 vkZ0XBUDK4tiKZmpEYX1fbDoJK.9BCEyQvyFFAQNIktd_c6NfP_NgBQjZxjyk8_1kwUKXztPi5mw
 7nvfe0QtiYQ0QZQ11n71B2Zge4XjfeCxTjMTLcMNiia9QE0K8FOenaTTJz1CrETHiNdLJkIZT_7w
 1NIqBvHNak8GH_VLJCnMZyUM4MCJKAYprJqia9csSK4jNbqER6UBFjgox8su3zGgLCiE5RNL_RbH
 aVIdnht8226zQU79uAjNUo4EjyTlcAvyjDHaf0dePA_w5uj4lbcAC4JJZ8DsmTD9Zk84Kv78lsev
 h3_ABGibUfHd16vT9CllOOON7ngLRqa4..iG01WXXsEWCmMH222VQpV9_WURadk8DM2o9IKxZqev
 44LIi8EMl2ThKUHDl_Xxvx9bdeKzH8oLCWVWkZEHZwihI4j_BMGi3B61EMSXzz_5po4WYHV6ycqg
 a9Hu3MpNK_H8YOpXjhzRW8bM_VBjvti279HVcyAqctUmRU.tz7.9aP_FKDWubxVy1FLBGHGItElX
 R2yRK_RuBUZq9YAqe.2Z6ui.Ky6K.7KKHK_Tv8lBv80NcC14brh0YPqh1xmV8zvsoV1gtUlgHLlw
 DrvhfCO8hJyw.7VLAv5nclCN8PscWKe5PbLVXD4IaNhmlLiQmypoG.pQSDqld2oDNh8Fod4enU3I
 ludW1BN5M_0h4FWAjnjweNLwDGuWKHFzA7ipXCP.T0H8yEwj92UYi0T2QeJ_XW9POu1nAfl8.LqE
 p9GnAj9AkC3Bn5xVJx..PHt3eDDSlvRgnOY7u8w8xkOTT5JGw3uwbCHUTmIQsgQnf3.dnPbI8_o3
 MR1gqQqskfSi1v_aI7PdzsIzP18T6DHzHuG26CbEBBfxHxkXq0t5EsrIBLHYz96dSgcSPoNtF50U
 77X8tiRiQoWMqpuVcHrbxdzruqVqp04vmGTOwmuF8KKJ6212hRLX.bu_E2WRcf7QPnoUNgMrBGQn
 RIHMRgpRwiAFXTJmaVZbiu5asoLGE.IFYmwE8O1uy4.bjra.OIwfWg2oxdMHlrwNp8QQO9UIZR4w
 6bS4linwZsfXOhycE5PRo2ak5GlZNYKJVvYJ.r9s_mP4vxHU3c0c8HXyhupVg9HPJR.u_ieimm7w
 gdWMH2z1leOQgXhApUDJsQc6TjKgeC09xVX0DbBrHuy40bln3n32PiEMLwaPh_8Vi0kuGLS93mWe
 FKZFcbH35Ff.j1QlJNuIZtC3idC.wZgMXvaFe0EBqCS4w3gtN.OBDktNbuevYCFxL9FsrAS1_DzO
 wDVuDeigb09JyrAT0ku_puTr3iiGLiUyL9UgM6T07N_I5HQ0EmGE6ugWX19W24dRrTx6LQPj2FB4
 3tj32IWJmQtYYkGHVgd8uM559ChauQXZ81L6.D3LtWiSUX_Nge1VPGZGluBg-
X-Sonic-MF: <kaizhetan@yahoo.com>
X-Sonic-ID: 4af70360-6c6a-452a-98c1-b83a0c6ea64e
Received: from sonic.gate.mail.ne1.yahoo.com by sonic307.consmr.mail.sg3.yahoo.com with HTTP; Thu, 5 Feb 2026 16:33:54 +0000
Received: by hermes--production-sg3-d7b46f8d-btbkm (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID a64b7a0c005fa991acb93cd341dede88;
          Thu, 05 Feb 2026 15:12:46 +0000 (UTC)
From: Tan Kai Zhe <kaizhetan@yahoo.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8723bs: remove unnecessary blank lines
Date: Thu,  5 Feb 2026 23:12:29 +0800
Message-ID: <20260205151229.240586-1-kaizhetan@yahoo.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <20260205151229.240586-1-kaizhetan.ref@yahoo.com>

Adhere to Linux kernel coding style.

Reported by checkpatch:

CHECK: Blank lines aren't necessary before a close brace '}'

Signed-off-by: Tan Kai Zhe <kaizhetan@yahoo.com>
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index ef2d92b5588a..7f1bf20300fe 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -1224,7 +1224,6 @@ u8 traffic_status_watchdog(struct adapter *padapter, u8 from_timer)
 	pmlmepriv->LinkDetectInfo.bHigherBusyTxTraffic = bHigherBusyTxTraffic;
 
 	return bEnterPS;
-
 }
 
 static void dynamic_chk_wk_hdl(struct adapter *padapter)
@@ -1446,7 +1445,6 @@ u8 rtw_dm_ra_mask_wk_cmd(struct adapter *padapter, u8 *psta)
 exit:
 
 	return res;
-
 }
 
 u8 rtw_ps_cmd(struct adapter *padapter)
@@ -1516,9 +1514,7 @@ static void rtw_chk_hi_queue_hdl(struct adapter *padapter)
 		} else {/* re check again */
 			rtw_chk_hi_queue_cmd(padapter);
 		}
-
 	}
-
 }
 
 u8 rtw_chk_hi_queue_cmd(struct adapter *padapter)
@@ -1877,7 +1873,6 @@ void rtw_createbss_cmd_callback(struct adapter *padapter, struct cmd_obj *pcmd)
 
 		spin_unlock_bh(&pmlmepriv->scanned_queue.lock);
 		/*  we will set _FW_LINKED when there is one more sat to join us (rtw_stassoc_event_callback) */
-
 	}
 
 createbss_cmd_fail:
-- 
2.53.0

