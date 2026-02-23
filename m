Received: from sonic306-19.consmr.mail.ir2.yahoo.com (sonic306-19.consmr.mail.ir2.yahoo.com [77.238.176.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 199E9364EB5
	for <linux-staging@lists.linux.dev>; Mon, 23 Feb 2026 11:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.238.176.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771847993; cv=none; b=Qre0SQ4pgh95SQWJUv7tPDp7sU8ShRU/VwW/Pj1MxK9CQGWeSKGW1NuQAT0Wtj4OBS5Nis2E19dBuldpNiUucTin2Ty/IJWTqlDwAGolh4Bp9uD8Zic3cHFhTnUiKrJ9MCU21GWXuOHo9jpSGM24pJdJsijI8npVfIJQAGebTmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771847993; c=relaxed/simple;
	bh=+BMluSvStmnTi/yiFWHwYCE0li46VqD7AgFYAYWIr0s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:References; b=rIMKJgtmnCaS4P5GP2O7owfVupIDO7lgU55vIl5IvFTPxe5ax1a2zVvaG8FX4JNKbOhGoEIYBUILBDSALq3vgMcdhp39VSejqZMTvednWrJbx3deCl9wVexYhk8bX/KvqZsM3VOxo7ZXB7kTeOR1jRRHsQZmO5SaPnmhmOp6xlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl; spf=pass smtp.mailfrom=yahoo.pl; dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b=jVtKl4qy; arc=none smtp.client-ip=77.238.176.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b="jVtKl4qy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.pl; s=s2048; t=1771847990; bh=ffYDJIWIWBbGIrVX2afvmm4J/f/8/9lGVhOLKsa9s7Q=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=jVtKl4qyDula46uEVpbtuL5Zl10q2ss1vpk/pNwiT3Eq1qeWILoMTq9TWBl2D94V5wd8UWim3Dp+vNMb4F68mtMqW4n3p+vuwXREf5QOTYl4qYUahXpFaLuDQic5ZpCYuRcFC4v6mLBN+TX/SIvw+pHWZULacBD1yCU3d6tIxaiJ5OijWNDJDgir8BiIdqaaPbq9Ga0tyYMhe0NioQS4Qoeko/6Sr2rztJ5q84lE1pwfINZM/6Li7cwNkXe57hzdJSpDPJGcpDgpdkpuaNndQJHHZDf5YtxnJtRPFu/6sOiTcmknbBV2R8hv8gKWuPk86oBxw5XyrPpUg3T+ohQ+uQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1771847990; bh=Gh6am78qZJfRPsaBVQOAr+8t8+qmE6P1PSF3jtThQcu=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=PiTIBVAxa5bwPiuNuyX9edojoEOPX33h83YBPBXfoQ3aAxfQNh1kQTAaBK6fSV/ZU5boIeT0Hz456l1Uua0mH22BmhB3oJI//CI65nwx3INcsazqmrsBK66GB3FCpV0hvBgA1AEz6MOZXa47nbGCz/6bM7NWZCGL31pF3xT8p4Bs9X0xY7ZNYrQE7K6za43/mqwo/EF6a3Ygd2OhF+61ppGqn6D0V7nwooOlj3YLwzgDC4Am7XYd2xrENXCYWSSEHlpp3K+4udxYgpvRDt40itJ5VwbkJmjuGpEFiXmZvxljrgJ4HhQzeogKpcNNPg9OozDQekDkRV/Z6dfShfoxBg==
X-YMail-OSG: jnSCog8VM1lgDDuM1nl1Z5crXO4JLGDAgloNNxZ7Nr1ZDOzKJ0VhDuBy7HUDZjj
 IpMUAJXBbJQHewMvk7BPZF0u.xy2fvWPJAz363Ye8Tt1XUH87iKa3g6jbzXdT06H1nqXeF_WS9QU
 wAOzP7RXXyd_oJNIuhRA1kAloAKUEfiXmknjW0cKnY.tgf5qQiAkqggWiGNv834TWUtK80ScKkEi
 Ykwy0cLH0T_JAsjYv7l6gn173r7WYDAgmox9kGXtPejZFq.3K5AYNAuZwDfAbFhwZPPfXoDgVdYN
 hGGxrThPyo6rmrxGIOjdgGNiKg2E239h8R1kTLuynrCNlW5saMWn09aKccsKFs7ck5TGvRi6NXpr
 sVL6lVNNoy3rQWjsCJ2jvzyzdl60AfjA.kR1R4ClgLbmh2IZ8KthZrcJ2U6M7_Mp0DAOa_iKOOrz
 ipvRJxxNIgV5XpNeoLbwZbTS92Y4TqlcDuSJQpRJ3rtHtNlUCr99E7_TLo6E6eE7uPPI58YFoLJd
 5TldQhH927wyIDcTLds8wkysNQ_cuo3YpsHput_.lA5AnR2qJJbqbSHcAjE81qhQVZacgZro09Gi
 Ani2RONgdsToZFJX0SvxQpSfd3LQojJIwxVZ6nYvem6DgnT_F1JpsNHL4wdIQmqS3WbqaprP31w3
 Q6UZtiy3DTwM7Gc9E5e8HcDdxKYaoBIQmy6D_B2ZZRXrVboBpGCPruRF3OKjMj6ULHxmofA2nDjc
 QlPLJ6N28QJyu7x6v9sprMmd.jo24ltawK6OxSh65BuEu37tVeSeuo31mq.R.yQHbGX6tfEogD79
 0fUG2BaT2km8fZUz3LbSVBSMceBNHYX7sgvoTPJN8n_4v4PVE9LZ.nToyO2vh8OVw5x5bhVrLcpt
 ebFN62UP1Ulpqhi4JsfpHhwSgnK6CnUzMmnK4hZHz0mGUFv_ZtD7lgYzWGPsSieidiup8fHAfdhK
 .EYXzK20cBe3XvHuWMS1de3c.bPfaNTHHabmK3DU_9XthDwAx9aQgsdnEH5ON0KQ95eVgf838Ttk
 HOy19.gwqG30MmABAgpqfVZIvEqxdZaYCMd38w2noMEnU4w4ruEYJJZRBfwjfawkgfT1stGGkCvb
 8TqJUwvaWH07fAFDvXoR0ivRjbKDOOCQCG71Z4DNCvJLNSo6TqV6.30RXQO1n.TnOdCqcYe25_2b
 SFaxglkaoKHYOBhLauFPPHFataPDdrpJ1jM888Cw26ARysC4T6JCXeZtZvFmAzSLwH23QKSlFdEh
 JRc1cEr8mNb6AQtJL6M3_NLquRxWVpNmZQBu080gAwA0j4qpr3O10x8s2vIA4afqesAVN5wNGViy
 UoD.j8VDNhHlr8PEooEpgN6DAxGTYNK7Hw_O4WtTpCzCgNM1kBtjqVnJOyXxhjocqCiVqxDrQ0EO
 pR7w83SfTWtbwgFXnTEVnhhFSGEuBkmAjyTipYMyTP.X.K9xQG1WNLrmaMFVe7p7kjeBRVzeZb2H
 udbETvRUFJc_.hObeBL0cyL8pA9aL46Zbo3UaYEY7P_JQA5loslTnaqMMPmLzSEtmaB8ohCpKSgw
 GqMLn_IDA7C4UXRhNAapDuEbBHUhuNKaCCsHiYOEugSEEG0FliWa0_pWx8tVPzzAmJqdnzV1r3JF
 i5PkujnE57j5Z86qrGHA1Qc7.j6K22ERezIdf4J0D6fr3vc1..U1EZbTulTxuQmr_AH.PKwAE_x.
 0Hcf8hFhPVNtQx_wu_DiWrnGuWmioy2Y_GtwDE1cMzfFV0HxyfEDkrw5MPX8FnVRwVxLYV3Q5RFU
 v7nhWryypj1A_B_0MwaHcBmNTaJLKuapjD2PVwLI3G8QkwRhpXfAFkYv3YB4Sxf97PD1HZURlbMG
 yV.PSsjn6ln9o.TwuCwwxd.swAXf3D1MjgVeydUy4Jn_rD9LIpNofjjVpAPCczZ1GiUpMQ6BHF2l
 Q8TlFTSfXUUy_mpBt1aNh1lqiwBlVm.VfK8V3bWw0L.SiMI2k6P3ibrbqn9scpztLrbtL0xbTgsY
 DoduApS0ic86A0DusY9EQFXS7_5PKOxBbFnYB_LOfIHqv0pFCBP1vCpbBCDlFi0LaLC91g.iobUW
 2LUpdCRyB7HCn5qUk90P6m2wUyf0Do5LOcLk53ztemgh_pxWwZNBTMFdeZhoDOb0uQJGpgPqsCSZ
 KXVY_se9AmDWwVaJ6G.MvUGMHHYHs9BSpoDFpI38mu.Ew7H0IcTCiX9ofchwsd7KZatml3Dg7ib4
 vItyS_upXh1DIxvyt4PpRcKaOc4OYWxfKCmB0tZYFQaQzCFQa1p1iILq6JCco8S9_Xdn2QM2y.ty
 dZsVC
X-Sonic-MF: <tomasz.unger@yahoo.pl>
X-Sonic-ID: 3ff6c227-6279-42ae-8e20-a2da4c125407
Received: from sonic.gate.mail.ne1.yahoo.com by sonic306.consmr.mail.ir2.yahoo.com with HTTP; Mon, 23 Feb 2026 11:59:50 +0000
Received: by hermes--production-ir2-bbcfb4457-v9kq7 (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID cc3bcd2756e569116d5189b6b8f36dce;
          Mon, 23 Feb 2026 11:59:46 +0000 (UTC)
From: tomasz.unger@yahoo.pl
To: gregkh@linuxfoundation.org
Cc: straube.linux@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tomasz Unger <tomasz.unger@yahoo.pl>
Subject: [PATCH] staging: rtl8723bs: fix spelling mistakes in include files
Date: Mon, 23 Feb 2026 12:59:43 +0100
Message-ID: <20260223115943.69463-1-tomasz.unger@yahoo.pl>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <20260223115943.69463-1-tomasz.unger.ref@yahoo.pl>

From: Tomasz Unger <tomasz.unger@yahoo.pl>

Fix spelling mistakes in comments found by codespell:
 - sequcne => sequence (rtw_cmd.h)
 - modifiying => modifying (rtw_mlme.h)

Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
---
 drivers/staging/rtl8723bs/include/rtw_cmd.h  | 2 +-
 drivers/staging/rtl8723bs/include/rtw_mlme.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_cmd.h b/drivers/staging/rtl8723bs/include/rtw_cmd.h
index cb44119ce9a9..c4c3edee809d 100644
--- a/drivers/staging/rtl8723bs/include/rtw_cmd.h
+++ b/drivers/staging/rtl8723bs/include/rtw_cmd.h
@@ -559,7 +559,7 @@ struct RunInThread_param {
 Result:
 0x00: success
 0x01: success, and check Response.
-0x02: cmd ignored due to duplicated sequcne number
+0x02: cmd ignored due to duplicated sequence number
 0x03: cmd dropped due to invalid cmd code
 0x04: reserved.
 
diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme.h b/drivers/staging/rtl8723bs/include/rtw_mlme.h
index 2a128568c6df..7591e28707fa 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme.h
@@ -76,7 +76,7 @@ Each struct __queue has its own locks, already.
 Other items in mlme_priv are protected by mlme_priv.lock, while items in
 xmit_priv are protected by xmit_priv.lock.
 
-To avoid possible dead lock, any thread trying to modifiying mlme_priv
+To avoid possible dead lock, any thread trying to modifying mlme_priv
 SHALL not lock up more than one locks at a time!
 
 The only exception is that queue functions which take the __queue.lock
-- 
2.53.0

