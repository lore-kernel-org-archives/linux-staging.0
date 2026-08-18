Received: from sonic.asd.mail.yahoo.com (sonic-euwe1-0017.asd.mail.yahoo.com [34.2.82.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFB003E44F6
	for <linux-staging@lists.linux.dev>; Tue, 18 Aug 2026 17:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.2.82.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787074564; cv=none; b=Ov7LGw9OpiciyViSZTvwy64lgxliljFuH2n0Ikdgn+xo04XdjhuV7NcUDZDjDk9qHRFORYpU8fc7slQ8hfJ4sGapgf61FsJzt3HHcR0v11Yg4pnm/RtO1cxhAgk4aLF6VWCP9cBmVlrsy9Jh6VOjUHpyNoSZoLdOdDOrVEqyNi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787074564; c=relaxed/simple;
	bh=mIuWZcLnOJNPVkb2Sl0U+n2jIHl25YEDK02mixiBr70=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc:
	 References; b=QMjTsghxkaDFRimxLHc5qaZu/vgJ4FcQaXHIuJG036Byts6DkPzrnJwqvm50qiY0F81bXonSZ2PQ/khNV5jOO7i6MA8MG6a8XLJD7GRGunZNIAPqrePtguRkXTiDkpLiVkRp1JjtshFzVFMCyTmgGPuA8G37uSkzNaWNSUAbPXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl; spf=pass smtp.mailfrom=yahoo.pl; dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b=rSORCHm2; arc=none smtp.client-ip=34.2.82.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b="rSORCHm2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.pl; s=s2048; t=1787074561; bh=IIaLeIKmR1BnQ8e5YMtP+xRkKX7gMhaSWzAFuWfY7P8=; h=From:Date:Subject:To:Cc:References:From:Subject:Reply-To; b=rSORCHm205BSjn5KqpOypAaT/Ole/fGL9lOfDqFipWLwUEkzfvvuyarzyf97sKjqYPDnHMdbbipoiJLciO5+aV9tRijEPpw0/iO8u6+N3Zd+UoJeVaaDAAbbKV7pHiwLEod5vcLfNLiRo7xD5d4msC8o7LmE61BCYunhyekCyLayLKWpuQDcBEfgdVIUVI0ZNKkF4BzfWgm8HaYsZBztD3GKpGQeTVTx2omzGTFJ9X3ihbVDIBBP2JqATgIoCBdQ5hgR9/bX8C/jTRBHf2QG7Ig2ufXp71v+kTsPAoPrKMp2FdR0nvKNJRQLxdn4aF+Lcz3o6AKEZ79+WcJ0mdhX7Q==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1787074561; bh=7EFerJWzRZB5Z3JKJQsUBsPy/rrdseMBWoGdK9cFY62=; h=X-Sonic-MF:From:Date:Subject:To:From:Subject; b=qL4JtB5TaUKYc8JY3lcRNGq3DNuU9bkJmaHCmis2a/1ITG6Wxpr4BJwOdVB3sN0ONZMeByQFe7SM+GbQXT/anlEabFCh2jmiflwlLqrR/JKhAUCPWfLbazn5A0NRjWKiA7hqB1JsqcX6DvVgDzoLV7ihJ0EElR4NmbHoVUszHXmnI70OCez3ElVPxAvepXGdc3WZjAlNoStsdZymaKfAH+6k8Q3Aj0ZmRkQwQVCDPpUmGQJIirqA8+HAkoVHbnukd9RKc6J6Vo1mfUnT0jc8iSnO8E7FN72KG8Tm3IaY6CJVfrYa98SEdGFO7S9ERwymA0+WczRdE7i04O8Du/Ewzg==
X-YMail-OSG: wSSb0ZIVM1mBvGhNSiltGckiiRTjoKHg.RWwDJnG_dAKwXIer37PLvHY1x76A8c
 Dr14sOmUCPIvNhcw.jCq1laRKUFjP6AxqCNXVuGweXfekFB9W_qPsVE9bE7fYt1_pN_l5_BGkwLe
 bA9lVQP06902ThExg1CRdUljy14hxTMKhCwpIatHMRFuxwE0hOHgi_dxpW0eRstveeD24Er.YnG7
 wk0pty6Flnnca6WqujpI5gna7HHn4JuuG4HYEX7uorA0SyhksFh4hyruWil6_9pUMvQri8g9lRHO
 INF2.TLuhUBc1gZ7ZnLcHfY24vVHDkHREW4ok0BMTPrVrLyET7Jl6n_F_NP5JElOhibS_n1gaNIW
 Mv3KQskWmetyw0HzWjx3dD3ZomuNH.4DkumWMjIp6OZRgijnJesH27DckaXGDWGA_EucpqZIErm1
 ycj_hsmXTVF9wfymbisLiwY4NIB3qkRTsSFGcpvWoyDJPKjZXAoFsZfJvBd74XUrKZTgg0YG5vPi
 6Oc5.AUERX50.usvRffEdmxcoCqUN1hycoC2OJRJ3YEitbJKgQJlgB4J7hcQ4vtRDFnynpXdoNAb
 _5484z9EESxpbGpjDR_gjININbdHDVyF.WDnP1_swnqSs36f6W3Uu4_PiVtOyz8e_DgeNnpA.0zy
 YpMQlLmUBh3YHj70zdiTgLax93VptYvaLkytCJ1C5yTn0m6Lwh1g7csPbonlCkpVZ.cM3mW2jdUG
 ZZvJfREjAiL_7hRBE6NzMyvnl5lwKOSAGL5jdkQjgaPHUTe4TmCVQO8OzXfpBmxTPzNZ_KJ.YI_U
 UuyZ6xJooIpRSEGtJJU.zMP_.tZ9He4CP0MBYhoKEQVOiwK0S.HR6x73FoaNuz8ysz6g_mUEY5Nt
 ZdD5xAp21QOU.95yqE59mnkR6Itdk7X1JjsfRrI80vvAGMA8JDr.Tp8hZHyo_IBW0M7je5zju4Ck
 AscT.BVMhfZT1Ml0n4jvxPGxUCI2Q.pX3E8wk3vTBlRvE0.HvG7KuUODGONSZLqgooBJRTMsF3kb
 hyyDpvtg5DU_kPWyCfasJZOUThk9vp9ROWHKe3SV7JVWSOnm9x4WEPNLPmMke8CgrHuJCHx3ZyMs
 d2aSrRJFgPbV_oU78nFu4vKpeAwgbZ1eDZBPYAjgQ_VsO1UdXgq6grp53USEEfz_JKbnQGiFVwJg
 SypTq4dAZ6A78NRl8hsLxIIqLxyJv4W4OTnccW.9VuCLnGYH00jD7lvIKAZpj88V4nL2j8rahMKN
 R1pSlYrodUyMgWvfDc373tqu0vJwfEpRBASTJ0MktObtkSgIdP9t_5apsW0qoifH0gsWTrg.8zN6
 Lfn1Usa2wDnQ7HzASUVJ.ZpVT2D8XbEeUH4R2a8b2J3Z4vCzQkYcmSAb_0VWRHcaAJ9sPHS_WLEr
 ybmwFJ8oITv2c_J9XlYNC2x9wxUZCy8p5Y8npsoHIPLoBHsCNlcI8EvUjdP3OfHZBg.zYQ5nwcuz
 owifUxEfmm3c25wiwxSDjCNXSjX.Es_AldGgIbNyJaPKyAue2BaKy2phoBeExBm.yBB.fD9PCs6I
 WQHbnqgx.Uzt_B1dLQk3Ie0.ASTLRbINSxuPfecR29J9R5Q0XZXYK3MxiylLwIyycRpnY0i1NiPu
 uHPA8A2f1fNVp3S7B6RuWxqJqSJBRlaU9AQmURStjEZ8S4Ti2ud0ioLq9pT2AzVfX2Hvyr9Ub7Lb
 Xxa8GWIvV.XPjki1JUmMyadyg3GtxSkTxwr3JAsIFAI3boXA.ppBpsbd4CrAyswRnaMmW2unQxv7
 Fo9MtlYcxTTlJpXzWEb4J_5wH8BRx7dbpgzI99ALYb7SbR8lCIvspVLBDX8M8LQQkijI9VonrkgG
 KvHKLHgKgt.1MiqZCS8OeWsBWyxHmC71XPtOX4AxvUlaM2IYsSGMlZzzQELMgnNUUTOlJ4LghXLR
 EgqH4EY0UeC4AyHc96JboYcA9W2X2cOkcASsDi1fvx5otI48J3.Whw6A1O9pFD6Op6gLauD0sf3y
 hjh7nC3xvOK5RLBsKnzdkdaJ8NI0FPwrTWKiJDBZX8u56yh_LKCcEQnOoeGGDPg--
X-Sonic-MF: <tomasz.unger@yahoo.pl>
X-Sonic-ID: 0b676298-202f-4757-91e2-2eb23d56f863
Received: from sonic.gate.mail.ne1.yahoo.com by mail-asdoutdeli-p-cin-euwe1-prod-sonicconsumer-svc-101 with HTTP; Tue, 18 Aug 2026 17:36:01 +0000
Received: from dip90.lsn.ir2.yahoo.com ([87.248.99.99])
          by hello (SMTP) with SMTP ID 143d56346fc65e28b44962d4fc52693f;
          Tue, 18 Aug 2026 17:35:58 +0000 (UTC)
From: Tomasz Unger <tomasz.unger@yahoo.pl>
Date: Tue, 18 Aug 2026 19:35:54 +0200
Subject: [PATCH] staging: greybus: use sysfs_emit instead of sprintf in
 gbphy.c
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260818-greybus-gbphy-sysfs-emit-v1-1-cfc81322e727@yahoo.pl>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ6CMBBG4auQWTsJrYqtVyEuLP6UMRFJB4wN4
 e5WXX6L91ZSJIHSuVop4SUqz7HA7CrqhusYwXIrJlvbpnbGcUzIYVGOYRoya9ZeGQ+ZufGnvff
 GHo4OVPIpoZf3b91e/tYl3NHN3x9t2we3DQfrfAAAAA==
X-Change-ID: 20260818-greybus-gbphy-sysfs-emit-69739912458e
To: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Tomasz Unger <tomasz.unger@yahoo.pl>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787074557; l=1644;
 i=tomasz.unger@yahoo.pl; s=20260311; h=from:subject:message-id;
 bh=mIuWZcLnOJNPVkb2Sl0U+n2jIHl25YEDK02mixiBr70=;
 b=lXAGw7mxDmYbQn2+YL+M/IKfMAR06fZxT6IJ7MSjRuHZhAerdEktk0ksnJ4FKOeGatP69NumA
 v2mFejaKGbABJoaju5Goam4mwVa1yEnLIga9d8s/m2wMu1FLpSw5ijy
X-Developer-Key: i=tomasz.unger@yahoo.pl; a=ed25519;
 pk=EPPsO91uz/0J2cTQ6ol+dgxYaieEc9dKSXWUb51n46c=
References: <20260818-greybus-gbphy-sysfs-emit-v1-1-cfc81322e727.ref@yahoo.pl>

Per Documentation/filesystems/sysfs.rst, new implementations of
show() methods should only use sysfs_emit() or sysfs_emit_at()
when formatting the value to be returned to user space, since it
is aware of the sysfs PAGE_SIZE buffer and includes sanity checks
that sprintf() lacks.

Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
---
Verified with checkpatch.pl - no errors or warnings.
Compiled the gb-gbphy module successfully with CONFIG_GREYBUS=m
and CONFIG_GREYBUS_BRIDGED_PHY=m (both previously disabled).
Both greybus.ko and gb-gbphy.ko load without errors in a QEMU
environment (verified via insmod and lsmod). This confirms the
modules load cleanly but does not exercise the changed sysfs
show() code path, which would require an actual Greybus device
(or a userspace simulator such as gbsim) bound to the driver.
---
 drivers/staging/greybus/gbphy.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/gbphy.c b/drivers/staging/greybus/gbphy.c
index bdb0f5164a6f..bb9a5b538e6e 100644
--- a/drivers/staging/greybus/gbphy.c
+++ b/drivers/staging/greybus/gbphy.c
@@ -31,7 +31,7 @@ static ssize_t protocol_id_show(struct device *dev,
 {
 	struct gbphy_device *gbphy_dev = to_gbphy_dev(dev);
 
-	return sprintf(buf, "0x%02x\n", gbphy_dev->cport_desc->protocol_id);
+	return sysfs_emit(buf, "0x%02x\n", gbphy_dev->cport_desc->protocol_id);
 }
 static DEVICE_ATTR_RO(protocol_id);
 

---
base-commit: 8d3ae59288f1e7d58d76558a6ee96d533bc5019f
change-id: 20260818-greybus-gbphy-sysfs-emit-69739912458e

Best regards,
--  
Tomasz Unger <tomasz.unger@yahoo.pl>

