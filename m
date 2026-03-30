Received: from out-180.mta0.migadu.com (out-180.mta0.migadu.com [91.218.175.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F97E35DA60
	for <linux-staging@lists.linux.dev>; Mon, 30 Mar 2026 08:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774860059; cv=none; b=dM0vSTOBFIewgE6uK4/KMkw+JktEGrekOFw+79ev4e2gB8n1XF7qFNsfTwyjlJjroD9GTQ1mXxPCfNJU8787JxyHosK2f7mXzRqo4vO5v1uZY8i2dWxdBTujCFeOkwRbLaX+Lmoza/sAIubsot0mfX7r6Bu04bEuSY0i/fgAayA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774860059; c=relaxed/simple;
	bh=XpzmNLR6h6VV4xMBdEBIW7rmsgiXWti6+3RZ8Qlwr7A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BZRpE/5E0nT4GUv8MhG5gvK9RiNBMCYIiE4ZSrdOjqxikVrd/OgYESAw640V9PqPNR7yOkLIpkxagHO9NVja05FNEX7E11IZfS4E6bxnIgAK0pCk8MKhpw/birYczlLbzLJLEyDQJschsvnU3Vg7xlmbemrebtlzf6r1hCQ4wIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=J7Lk50Li; arc=none smtp.client-ip=91.218.175.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="J7Lk50Li"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1774860055;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3VhVuBhob6553M8Pn+GHtuDkCaFBlbvc7w8Anxm30M0=;
	b=J7Lk50LinAjuCZYvVRlVHqSDK/PPkTOJOCHZO3lH/1Yszn2Fn6gHSfg7kMygI1vHxsWC0Z
	33irrhaBLmGfkKIYABPuQRwKdm5cek2/FL4/4Gl9TFHSvaFJ4uJNgEUmiNIzPSU7e9Ah0e
	E3aR7jzXIx0htR+4UcfkOrCHJkHzKfA=
From: luka.gejak@linux.dev
To: Marcos Andrade <marcosandrade95963@gmail.com>
Cc: linux-staging@lists.linux.dev,
	luka.gejak@linux.dev
Subject: Re: [PATCH 0/2] staging: rtl8723bs: fix boolean logic and clean up coding style
Date: Mon, 30 Mar 2026 10:40:19 +0200
Message-ID: <20260330084019.4356-1-luka.gejak@linux.dev>
In-Reply-To: <20260326014221.525368-1-marcosandrade95963@gmail.com>
References: <20260326014221.525368-1-marcosandrade95963@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Thanks for working on this cleanup. The series is well-structured and
almost perfect, however below is my comment on what could be improved.

PATCH 1/2
Looks good, the defensive fix is correct and the commit message explains
the rationale well, but:
The subject lines use 'core:rtw_wlan_util.c' which is non-standard.
The kernel convention for staging patches is:
  [PATCH <n/m>] staging: <driver-name>: <short description>
Patch 1/2:
  [PATCH 1/2] staging: rtl8723bs: fix boolean comparison Switch_DM_Func

PATCH 2/2
Two issues to address:
1) In adaptive_early_32k(), you left this unchanged:
   if (pmlmeext->bcn_cnt > 100 && (pmlmeext->adaptive_tsf_done == true))
   This should be converted to match the boolean fix in patch 1:
   if (pmlmeext->bcn_cnt > 100 && pmlmeext->adaptive_tsf_done)
2) Patch 2 does not apply to staging-next tree, please rebase on top of
   a staging-next and resend

Also one more thing, please make proper indentation, if you are line 
breaking you should allign ( and ( from line above. Same for letters 
you should allign the first letter in bracket with the first letter 
from upper line. Your code: 

-				rtw_hal_set_hwreg(Adapter, HW_VAR_ACK_PREAMBLE, (u8 *)&ShortPreamble);
+				rtw_hal_set_hwreg(Adapter, HW_VAR_ACK_PREAMBLE,
+						  (u8 *)&ShortPreamble);

-			pmlmeext->bcn_delay_ratio[i] = (pmlmeext->bcn_delay_cnt[i] * 100) / pmlmeext->bcn_cnt;
+			pmlmeext->bcn_delay_ratio[i] = (pmlmeext->bcn_delay_cnt[i] * 100) /
+				pmlmeext->bcn_cnt;

Correct:
-                               rtw_hal_set_hwreg(Adapter, HW_VAR_ACK_PREAMBLE, (u8 *)&ShortPreamble);
+                               rtw_hal_set_hwreg(Adapter, HW_VAR_ACK_PREAMBLE,
+                                                (u8 *)&ShortPreamble);

-                       pmlmeext->bcn_delay_ratio[i] = (pmlmeext->bcn_delay_cnt[i] * 100) / pmlmeext->bcn_cnt;
+                       pmlmeext->bcn_delay_ratio[i] = (pmlmeext->bcn_delay_cnt[i] * 100) /
+                                 			pmlmeext->bcn_cnt;

Best regards,
Luka Gejak
