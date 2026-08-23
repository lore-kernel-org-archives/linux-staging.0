Received: from sonic.asd.mail.yahoo.com (sonic-euwe1-0017.asd.mail.yahoo.com [34.2.82.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA3712F8E98
	for <linux-staging@lists.linux.dev>; Sun, 23 Aug 2026 10:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.2.82.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787480318; cv=none; b=GLONZsc9et6f693bkRYa0s9xdyVOYHsPFMpAVNIH+hZR0C6LFJDUuWrWBy1GJGjmo0HCJVxIcmixDBoL1/20BHBBgZLiUQxK8bFZ8gImOby2FGhOmmW9OwsbA8Z1rXs4wTsh+cKzr8HUtAmfFCy/cu5B5A3EkcQCXdi0pCSosLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787480318; c=relaxed/simple;
	bh=g276pUyqZAjECU33DAGrzwCd6z0lbj4xBFUxYuKx2iw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc:
	 References; b=hbloQzALWzoKCfCvCyHsYxelgWg5j6NJ22ypom4FKaCz6Om/aa0ujDAC806KcubINT8JNRNrIXMktx0Q85voyiVNiJWxMc+quMF4ncrxblMllP31dCq7Mkw9+K7HfXVk6gWYvn3XhDzbVVmA79tUZzMNEFAQTuj0GfJRDqYuil0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl; spf=pass smtp.mailfrom=yahoo.pl; dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b=CckAAgi7; arc=none smtp.client-ip=34.2.82.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b="CckAAgi7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.pl; s=s2048; t=1787480315; bh=awD/8u/OEK36pIMmelPOEXf66nP9cTIx6cTh7X87uKI=; h=From:Date:Subject:To:Cc:References:From:Subject:Reply-To; b=CckAAgi7xPdGEXqfNGDiLfrmgvGy1g3pS+NpE1vBIVlrEaNcHd3QqMfXWZhCgqbzltSSSbMQlpta8k0KiHcyDnN8orRmEqyRIx5rb+qOfRNMXJOpepOIZRj633zWRQP68hLWbE/aRF9uQehCXaB/xtZKfBstMgfwHlVeLOzw2jerUKakhCisuCg6aoN3t+5F7yrJYqROsR45yiF0GdDh1nkOqchlWBrorasPvCR3Ir0kdP0oYVpWWnov+Sv5ALs3cbgulXrKmujEC22I35FN2wtuWRgj9M8lVCVcfCV1xawL+MSH8IJKIiIfKcCHRGxkkW9r0LkGNpemgo7yzuM1rw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1787480315; bh=kHUfeofvhSiN+CKu4zEKd+83/T9v8zr6SCkVRflwHva=; h=X-Sonic-MF:From:Date:Subject:To:From:Subject; b=lNWy1szpAEZ2zV8SuZYAOjlIYkHxjKm3ly8Si+O4e0I+9z7YhggsODkxu0u1JEg6x8dua6wkrfMgP8/SuLg4epoIda++bw35Es2gMpRtSdhLx3heS6mLi3stOW6k1ctzUBFEJCbPoIVZ6fYBCtA9JgwMXC2G8LFlz8y8wmoegGbHuhhrF+nwsPTjc35hdIrdD0v2RyItkC7MT9zlFho3OOPesLJeNhNy9JDUzEgYozynWYptBUsXEtZBtN6ExgBG0NdYL2HO+uKd8Pj1lSIp+iz9G/8Ap5vpvb8TY3/nif5b/Jih+XjhDJU8MLE2i3HnlB7iCqnSa1a6aAu7xZ1+oA==
X-YMail-OSG: UdDxVSgVM1m66LbSF6z0e1UavVsMdmOXWASCCj2zgPfnB93dNJ5dU09fLSsDdYP
 BJ4yYJKT7jjuRCaoteRmOXnuZsnebr7Cbn_r_oH_p7ce22lXosJVIQushBI21LsvVCZVfLtQ5EJV
 Ke.f99_2.OGNNOezZteQsnno_rd_HhkBaRGPxpqUNB3vOY9J28qGwAGqLZ.8ayp5kd5MV0v7GjE_
 XBxddgnymjLvvPXyEpZMn55_TwJFQZ.BHShGBjiaOP4TlV6oVktkAVh_jn7QMmhoI990m1InIUFk
 cDkvxCP1P0QHfEkfL6dRZcBPFD9NgaBtALhLYO2uEpcT3hYe4w5y7CvpT7bAKNcmyfOTgVTXn20t
 lrZz13n6J7YVrAc14uxTY_ESR4f.Ar2N..7P69Rk_7UKq8CYafhUXj7Hbcdz3gDknaHOzq0pjBPZ
 ggo4z_CcgdvwaO_5bV0Vhgryqmoatc2QChzXI_SeiuxTVXW9RSEBLgWztj3pP7nFGCNjlphX62KI
 Wkyc348Htcg0qJvPIwpflAFAMqM_OuB7_R6jpowrQo0BXX6wBgc0.PzNQ_U7sa3m6eahgJTrigvC
 i9jnVVgOoL6cAjV1qDGFqaxo6_to2I1PyTBLv2TMeDIoSreXMGdY4ibu4rPsUVioi1suO5Ck_4Jg
 ZGSGIFX7AlluaucDu7sDc_h17128N3NLrQmLlN8oOuF0s0Fzb.LPNjjo_JiY780e8NinzHpM1eoq
 3JyefvZxLm00ywsacAzfQ2ovKBn.RZ.8L9q2LZauF6xrs9o0LUTp7R4hoddK7VSbx.mV0_JUr6wO
 DYwFRezgO5vwPNJuTTgry1Zzze3uL2J92Z5spJtddlc7Zxd7Y2to_51tBK7jgM3GnhapFuu7T0XI
 Tmwm7SC_Qrt0ApEuT.Nf5W4JHUArAr9n5L9olAzGVr_Y44Hj1TKj2VGm_blYcFslTRkdivRNhj_z
 aKJrxS53tDZGbzb..y73DCHiAWe0MHCwl1i0rGkEiRXXN1DnkVqHCW6zKh8582CpGpltMgrlQKrs
 UsauFxSXMJrI81eKeMMYOWzoNi1sTdsaZ4ENdCvEAtYOnf9S77r8na2k0SXVq3NQ1pZWmn4cIjuC
 WIeCn.8GKyJzablj_PT3QiyKTw6M4xKgGZy5YWuQOjT63c2OBkV_V7RnNY37UyTZQ2Lyq7L0.Tg6
 wd5E6HS26PVggUh6Bb_LqMqCGS.k9WWqG900aCj9nzkSHoi4M538zz5yLM4WuqZIZBV.Z9dy3Zdj
 MIUal761MaoP8_JqYLthn6BcTpoKNW_Pv3WA2FgiZ.5yrGWO6dffTbO8ZsHDQPEur7zEHBfMP5yW
 Sa1kJtndvQIchvFo2IKHmerWTRwg5nTjo2rDyXHz2mKP4kIBzHfjTZ0d7aHbm2cT_ONsmihBEtb_
 mwfUi8L4XX082D7wUkziTUFK.KA9Msb1s7phf6VMiGr1.nKJQyuy9N8YyQrgD6u9P_V6KSJ2bKwB
 hQbw5l2zlnT1k8voYQjodKHnKLm_rinAQplrOuqJj36hro2Lz_6IHaKNqQSxWbwLrT9Xqu2KL1TL
 6MkiT8pOHur1kFq_X4CCIz9D8iM3PNC.dkNeRf0eSSeixg3SlRvze.22RiAXvMHCJr.Wr6vl8BuZ
 _DGexugVXjhEelTBstZfpbY6rL9g0jGskNmfjTffmxamjpr8lzjxbnuFp5LYSkh5Ud7MfNZUgj4I
 9RGUa0hwy2LjfHU0qRVmS3pId_cVtF88U6bxT1DRJATX3TxwFjDJawZPsq7nYlabmxk2HMmDCUWu
 Erhn2VeWLDf7Kq7Ym.zcP7WZsehlTmNEzoO6JNi1sLewZcna0IZGRE8kHa.Aod4zY8ZjsYp..dF4
 2zKQHJyQZt5WB01qrVAMf16dSWcIFn99aNuDgJlDdGxu8QpJgMmVsHVo.t5n9eF3BynVWtSn.Nez
 bAPsYfuejVXHlPDyLweD7zHqdQy6AkAhaLBBpyQgpFZsrHlj8rXIbTFVJl4aZe_T8KFg2zO.vSjn
 DVY4nY_yyfvgJHG0k51wOGRow9fuweJq5
X-Sonic-MF: <tomasz.unger@yahoo.pl>
X-Sonic-ID: c22a5d94-8396-4f64-9f4e-c4ea92700c6e
Received: from sonic.gate.mail.ne1.yahoo.com by mail-asdoutdeli-p-cin-euwe1-prod-sonicconsumer-svc-102 with HTTP; Sun, 23 Aug 2026 10:18:35 +0000
Received: from dip162.lsn.ir2.yahoo.com ([87.248.99.171])
          by hello (SMTP) with SMTP ID 4cb6950c4cfda6384655f946b591cb65;
          Sun, 23 Aug 2026 10:18:29 +0000 (UTC)
From: Tomasz Unger <tomasz.unger@yahoo.pl>
Date: Sun, 23 Aug 2026 12:18:28 +0200
Subject: [PATCH] staging: media: ipu3: fix typo in comment
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260823-b4-ipu3-mmu-typo-fix-v1-1-3e5589232b18@yahoo.pl>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXM3Q5EMBCG4VuROTYJra2fWxEHZQcjQdOq7Ebcu
 +Lw+ZLvPcCRZXJQRQdY2tnxugSkcQTdqJeBkL/BIBKhkkJIbDNk4yXOs8ftb1bs+YdafJTUZZ6
 rooRwNZbC/GTr5rXz7UTddrfgPC8Pqn3KeAAAAA==
X-Change-ID: 20260823-b4-ipu3-mmu-typo-fix-a2563a977689
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Tianshu Qiu <tian.shu.qiu@intel.com>, linux-media@vger.kernel.org, 
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Tomasz Unger <tomasz.unger@yahoo.pl>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787480308; l=1098;
 i=tomasz.unger@yahoo.pl; s=20260311; h=from:subject:message-id;
 bh=g276pUyqZAjECU33DAGrzwCd6z0lbj4xBFUxYuKx2iw=;
 b=fFY9HMu4h6X2wyU2LtStRg313gPp6Q4RkFOgSCu0v91rk9jHsiUMl3AlUQ+oYcQ+VYQ4T5a56
 9NqP67cpGPbBZvvYj1E/b2QkfrcIC/f0XPXc3YevQFH3hHewoioFCnz
X-Developer-Key: i=tomasz.unger@yahoo.pl; a=ed25519;
 pk=EPPsO91uz/0J2cTQ6ol+dgxYaieEc9dKSXWUb51n46c=
References: <20260823-b4-ipu3-mmu-typo-fix-v1-1-3e5589232b18.ref@yahoo.pl>

Fix a spelling mistake in a comment: "singlely" should be "singly".
Found using codespell.

Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
---
Verified with checkpatch.pl - no new warnings.
---
 drivers/staging/media/ipu3/ipu3-mmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/ipu3/ipu3-mmu.c b/drivers/staging/media/ipu3/ipu3-mmu.c
index b196a5815903..4595e3749e7d 100644
--- a/drivers/staging/media/ipu3/ipu3-mmu.c
+++ b/drivers/staging/media/ipu3/ipu3-mmu.c
@@ -313,7 +313,7 @@ size_t imgu_mmu_map_sg(struct imgu_mmu_info *info, unsigned long iova,
 		if (!IS_ALIGNED(s->offset, IPU3_PAGE_SIZE))
 			goto out_err;
 
-		/* must be IPU3_PAGE_SIZE aligned to be mapped singlely */
+		/* must be IPU3_PAGE_SIZE aligned to be mapped singly */
 		if (i == nents - 1 && !IS_ALIGNED(s->length, IPU3_PAGE_SIZE))
 			s_length = PAGE_ALIGN(s->length);
 

---
base-commit: c6eb4dc5964fdf4086b73b7f0f5dc0d595fb5cf3
change-id: 20260823-b4-ipu3-mmu-typo-fix-a2563a977689

Best regards,
--  
Tomasz Unger <tomasz.unger@yahoo.pl>

