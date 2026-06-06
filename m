Received: from outbound.st.icloud.com (p-east2-cluster1-host7-snip4-8.eps.apple.com [57.103.76.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7C4F30F803
	for <linux-staging@lists.linux.dev>; Sat,  6 Jun 2026 23:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.76.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780789501; cv=none; b=ICSrmIVTSlf3UoIOWcvJjiZXqkVd3CLkHLHrSSI3QYq665NUEvdV/ObKA0iizTpG0CpiqPJOFZzvFih8C39snIfIBbSozxyoS+aYByWM88Z6+pX37TY1wv3EGvkLRfuhQJmwg5bhHw/oqUbSKpM7Nu3toR8LYAqrIiXJdkmS6Ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780789501; c=relaxed/simple;
	bh=f25YXMh3jw6eY1n4wR9IpEbBJgwzmFwEbXaDXDu5f/0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fDgQ1wFnyQpRpqHEz9J+7D5+F81occLkA0+2Dg9xWtDB8khy9wfTN2fSeL2vtGuB04zmo6InNqdEhwfjlYNrQCZzcu4jZ8rbbKdTWQ507eAowxNIpBt9jLVau2ZHwllDV0YOMiNyrhlInAQoUqnI576xTWwqeL1v+aRwuTZPBuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=notrealandy.dev; spf=pass smtp.mailfrom=notrealandy.dev; dkim=pass (2048-bit key) header.d=notrealandy.dev header.i=@notrealandy.dev header.b=EQTE/ibJ; arc=none smtp.client-ip=57.103.76.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=notrealandy.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=notrealandy.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=notrealandy.dev header.i=@notrealandy.dev header.b="EQTE/ibJ"
Received: from outbound.st.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-1a-60-percent-0 (Postfix) with ESMTPS id 3D7CD1800883;
	Sat, 06 Jun 2026 23:44:55 +0000 (UTC)
X-ICL-Out-Info: HUtFAUMHWwJACUgBTUQeDx5WFlZNRAJCTQFNHVwOWBxAF0kGTVIPDxxQFkYVdwVdBEsdUgFWBVYJFxxWGxcNVk1XF0cfUgpeEVccSkNTDkRQSxsOVBcDVxxWRVwYQwldBVccHR5DRVsTVRdGCRkIXR0ZCEcfCjADQg5WA0MHRQAtGRxXUFkERgJcGV8MWQ9LXl0dRU1aAlZNBUoDXwFbBEAPSgBZA1kFXgBBA18aWh8cUBZGFXcFXQRLHVIBVgVWCRccVhsJS0YJSR0ODkIYRh9UJ1cCWgpbHg==
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=notrealandy.dev; s=sig1; t=1780789497; x=1783381497; bh=D1StYL6U9gU2+jj+JbZhPSY5gf8iUhPFr30wac770RQ=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=EQTE/ibJYw/oyasmViiRoGKEnzn7KZ578dnmal8QX5tyO8UGnx1PI6VWalqyp05A8FL86uTZBkZVmGPumnGBqW8GO9u84i7nDYh3f+DyYs+PtVOHc295PaVcmDFWfM3fviY1Bkkf51ffUu3kqBvsMomIUldkB9OLDXphvXj+Wm7v3dHhqmRNwuXNVYPv9XE93YTk64FJ6uJpqrqF1zJhmysEL84SQP+v3XgxsE/sBJHy7IBhFVGRxOzHL6ZxIpM6D2vt89Gyn0p+ugpm8N2ywnWUXwvljJWVym+liX8jwpHGUmf6AANvZpBm4zF20xCa2CQa+cBLtMR+coY//Cy5Ig==
mail-alias-created-date: 1780788294906
Received: from 68c3084b1005 (unknown [17.42.251.67])
	by p00-icloudmta-asmtp-us-east-1a-60-percent-0 (Postfix) with ESMTPSA id 3F5F1180088D;
	Sat, 06 Jun 2026 23:44:53 +0000 (UTC)
From: Andrew Soto <linux@notrealandy.dev>
To: hansg@kernel.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: andy@kernel.org,
	sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andrew Soto <linux@notrealandy.dev>
Subject: [PATCH] staging: media: atomisp: prefer kcalloc over kzalloc with multiply
Date: Sat,  6 Jun 2026 23:44:27 +0000
Message-ID: <20260606234427.9902-1-linux@notrealandy.dev>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Info-Out: v=2.4 cv=PJ0COPqC c=1 sm=1 tr=0 ts=6a24b0f7
 cx=c_apl:c_pps:t_out a=YrL12D//S6tul8v/L+6tKg==:117
 a=YrL12D//S6tul8v/L+6tKg==:17 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pDUkijPYcnCcty---KEA:9
X-Proofpoint-GUID: oE_mK9xeJBWVOZBbE9luOc4P5Dxo5xvS
X-Proofpoint-ORIG-GUID: oE_mK9xeJBWVOZBbE9luOc4P5Dxo5xvS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA2MDI0NCBTYWx0ZWRfX99RJ7y57oxFR
 W6H8oEEslXafKXJXFqf1g6SBkf0UTdWJuWkCOudJBmkvszAVPZowSxfR29RBWMdNV9ECn255Vas
 bnInCWGHvPnqVdmFzyQ4nwMUgcHSda3P6T0CEB93vPtftFABJcmcd76FJHH2W9Cne3A9MXkwdvX
 4sbyBw1H+ASMpUq67g2jEMC001SLHFavgAMStRiwwRmIk3ys+IkLGEZi24LFvDaNy/5k9SybxC9
 tWOpfrDR2VqZMX/RdkhY9ff5qSPXpb9lsBcO8pIUx2493V1i6DRcn/hpjqXj/UtgBJ7eRfEPUoH
 SImPqw/gf6XQnOVm5von56z+JfW8N7aj/THkWCyWECj3ozvs63LYOiNehuiqwY=

Optimize memory allocation layout in sh_css_params.c by replacing the raw multiplication inside kzalloc() with a type-safe kcalloc() array allocation wrapper.

This prevents potential integer overflow vulnerabilities by validating the array size calculations before interacting with the kernel heap allocator, aligning the driver with modern kernel memory allocation standards.

Signed-off-by: Andrew Soto <linux@notrealandy.dev>
---
 drivers/staging/media/atomisp/pci/sh_css_params.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_params.c b/drivers/staging/media/atomisp/pci/sh_css_params.c
index fcebace11..9147ca047 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_params.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_params.c
@@ -3716,7 +3716,7 @@ ia_css_ptr sh_css_store_sp_group_to_ddr(void)
 
 	IA_CSS_ENTER_LEAVE_PRIVATE("void");
 
-	write_buf = kzalloc(sizeof(u8) * 8192, GFP_KERNEL);
+	write_buf = kcalloc(8192, sizeof(u8), GFP_KERNEL);
 	if (!write_buf)
 		return 0;
 
-- 
2.53.0

