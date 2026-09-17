Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0681649AA47
	for <linux-staging@lists.linux.dev>; Thu, 17 Sep 2026 21:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789679318; cv=none; b=cosdw9EmqbVYtI2rXyRbdfouMZD5ie/MCGz5go34Fc9RmH+yNGOSmS/3l0Nm1IFzR0puB57fEWI1ZAtl2zJgKTZy0umYoUi6/LqLobJjdBxR0BPtiu24Blo2lnh/y2yH09aOObIA+VLJp4FPb8qbxLCTqZrUnu5Zz+QwArA2Ohk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789679318; c=relaxed/simple;
	bh=bzDavEoyisLgV9Dqni7EvV59qJaL7uG9lj7oSTHVBiY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=uYhkUAuqgpFKqSEwm2mnECngb7o0Y70p4TmtLdaJnHriQTreXN12UNXm6n/270rQ2A7z/VUTDgH+ukWrUqaxZiJmECA6pmdfTMdOtNTA+LJaEIJsCnoW/Ekxy2jsJi3SGBB10gegEpnyA/hbn1dRn+g6ME6JLfQAgRmgR6vHP/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l1EQfIWu; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l1EQfIWu"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-48583cc7ab1so5579f8f.2
        for <linux-staging@lists.linux.dev>; Thu, 17 Sep 2026 14:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789679315; x=1790284115; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jdp2C4fIqt7YuChYvn7y27NtEdZt9/0KRN/uN+Dhw3k=;
        b=l1EQfIWuxZtAm0j2Uidhyl2kzUFl7kPFAE5yOtrlwD/QHqU/UwAOli5BjWJKJLoKZo
         Mfd0AGY/SIaKfQDdXvXzfXpsoyeJFcf7ooCQGs1TwxxX9bDbVUIiuLqDVBmGJeBuBhya
         bjJ2xDWqpVEs+yGbtl+TQmi2OI0KRNg64lrw47+eR3PhfW6Eb7TGWkPXIHHXV514hdxo
         Fw18Kc5SoHCsNFFIR65+hJO2Bkvv0o55Zdb0QCFWJHJbjkwynXnOShV+TUuIGIco3i8c
         +6CP1E8EiIM7AvHSvQ+nOLbzBW6k5F1101STGIgU06jozRo95Je6MYqZq9PnqpwomGSM
         Prnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789679315; x=1790284115;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jdp2C4fIqt7YuChYvn7y27NtEdZt9/0KRN/uN+Dhw3k=;
        b=1QpQgPbkFGS712URpf4JSVMs5nbUb8oiWavdYh706Mdk2lmHQbAugPwPVy8yOWbQq2
         iq+Wa2V/aBPN/gdtOb8iyMj3FndZi9LDj4YiPp9sQXDx7UHg2hGiGUo1ocGdeRFYNPg1
         LOJsnlZy+nJExxePl46wt1a0UnnqByF+PyDEByjKjrD14vELuiphAII9Us6y1C+hC0aO
         6/MvA1+B1Q/3hw70p/ozz6kRjOBh+jJogsj//3UtUMZZeP22BiIHmRzCLpy1LLde213n
         NLufhmjrq5mnGGxG393ycM0XZ2XY1sJumhTGCv2zf0QLh+HZN5gx11MGzzJkQ4mgBvFe
         GpOg==
X-Gm-Message-State: AFuF++kyzTU9Lhkt99ksX6IYFMLUl7aalK6WGRF+fLNL5Gr5XDqsDQJd
	yNqwa26/olQdPXKSyLfgX9VI6S5mALNevr5vCb9uzoMVj9DDllDGmOf7
X-Gm-Gg: AYBFou3ehiws/oToR8HmesQ7GHYnVQ9GAwa8INUzQodBvyTgX8Xxkz9l3h7CELXdxCT
	gfMSBvZlY5wBRAbI1xDvvABXzl5uzD4aUnGkN3wqFaLi1w5kl5f0elFWsrMDfnR89S4nvoE6g8S
	RjNQzxOxbwF/xN6CNFXb/daBQBM+BMtGMQg/RPzYpZlyxInOdmPoGNkkb5Vm93eW4HNk10GcdPi
	dxbeqKKpZ6d778Q41orra6CkDWl5K5NxfFqD1UnXwrP/aobEvUjdvXy1O8n6W2cYqUjv4fPL+Dw
	jTJNs9B1tP9nyefc0Q5DNdQVFXXNR2ZljUIV00A5+Ipq3KDBtr8pHC08xnXA8HDaeUedhQP9Zbu
	hmUabCwofTDkKrFFQkE4oWmQ5xxz7VbsL8raoFK67mGcCfx6FRC9KWWemq96MPXpzbdPZ8igf0T
	9/YOVSbmQUriYlndXOVLLwyLL1+eaE0Or8o9QsIRo1ZDLcIE5KVkwwNCa503tzx61cNe+DHlrN5
	aatTss43ZiIHv5TMH1Efg==
X-Received: by 2002:a05:6000:2382:b0:487:c76:4d12 with SMTP id ffacd0b85a97d-4871e2132c3mr232680f8f.11.1789679315024;
        Thu, 17 Sep 2026 14:08:35 -0700 (PDT)
Received: from ubuntu-4gb-nbg1-1.. ([2a01:4f8:1c19:b0ad::1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf1f98csm18394730f8f.11.2026.09.17.14.08.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 14:08:34 -0700 (PDT)
From: =?UTF-8?q?Rare=C8=99-Mihai=20Vladu?= <vladurares@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Rare=C8=99-Mihai=20Vladu?= <vladurares@gmail.com>
Subject: [PATCH] staging: rtl8723bs: remove unused variable phal in rtl8723bs_init_xmit_priv()
Date: Thu, 17 Sep 2026 21:08:02 +0000
Message-ID: <20260917210802.1081830-1-vladurares@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Remove the unused variable 'phal' and its assignment in
rtl8723bs_init_xmit_priv(). Fixes the following compiler warning:

hal/rtl8723bs_xmit.c:528:30: warning: variable 'phal' set but not used

Signed-off-by: Rareș-Mihai Vladu <vladurares@gmail.com>
---
 drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
index 7f55448d5..0441e84ea 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
@@ -525,9 +525,6 @@ s32	rtl8723bs_hal_xmitframe_enqueue(
 s32 rtl8723bs_init_xmit_priv(struct adapter *padapter)
 {
 	struct xmit_priv *xmitpriv = &padapter->xmitpriv;
-	struct hal_com_data *phal;
-
-	phal = GET_HAL_DATA(padapter);
 
 	init_completion(&xmitpriv->SdioXmitStart);
 	init_completion(&xmitpriv->SdioXmitTerminate);
-- 
2.43.0

