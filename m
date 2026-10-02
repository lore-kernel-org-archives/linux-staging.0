Received: from mail-dl2-f12.google.com (mail-dl2-f12.google.com [74.125.229.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EE9C349CCD
	for <linux-staging@lists.linux.dev>; Fri,  2 Oct 2026 04:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790914105; cv=none; b=juKPBobeNvYWzvpQHxdxXdmzsRRRdZpJRd5cfpLHzkAAp/Fij13pF/nE71VW2D/YHPk6O/z3smvLvDngCsbDP5yeLn14f78m54YiceQrG0qnPEu9m/+hDo+xembNvuxBGZaepQunu5Ll44x+gretFZOo31FIxnHDgG21caKNrhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790914105; c=relaxed/simple;
	bh=DINkjq05zx+pWUD1H/kC0SeYGjB2tuKtoVlRFcjbv30=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=q3qaPIguRJn5JUFX3BAMqAuI1FOf4SWWLx4jD+aBINYJP3MJa2kBo//NyGroErFCIe2/eBOnezPYOB3/XQX3z1vKdhxL5mDiTMOeBFVuOFaEP+Vh0/t2wIUjMsn6+n2/4X1DtrOSgt/kKpYJ8AI2QFsNKeuNr7vcWpHwZCsLh4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QX5uCIQM; arc=none smtp.client-ip=74.125.229.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QX5uCIQM"
Received: by mail-dl2-f12.google.com with SMTP id a92af1059eb24-142dd046b87so5739178c88.2
        for <linux-staging@lists.linux.dev>; Thu, 01 Oct 2026 21:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790914103; x=1791518903; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dP1W63z8La+eKKPJrNiJLOuUR8uNl56iwVgv8Gujr9w=;
        b=QX5uCIQM7G3O4SFZLGfx4O+cDUPsdFoOUO3bBaFf2TI82gawOuF5zDE2J8H124uQ9R
         /OQuFIE0XVDAjpApFylz1Qcf4vJSe9QD6KQliszNhVzyM+rKIxGQZFBkkCsYTGdvqwSi
         beqEXVmJxtbsI5HpqeA/6zLxjSPjjhth3dne+ioDA92lR+ERKjfjMofZ3eGvPEL4n8KH
         hJgLuR4SAbYF2Wydf+3j51dXswA43MKu4IbUmRrTTq444/WhW6HHtqHzXKJ0Paf/2lD5
         qaVMQUnvu/UkY+IcnKB+bie0VaUWFRjFWhLFQSbk8uzPhkleybt4NuPAZuRcjqcJj0VS
         nWjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790914103; x=1791518903;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dP1W63z8La+eKKPJrNiJLOuUR8uNl56iwVgv8Gujr9w=;
        b=Qk8dYyeyvbSNkREtOGIaTjswJ6mb1pC5rPlC2tk3PIuq9s71IdN1W4g9XmftiI8Aos
         UnJ2GLePGA/P3R9Bqwwli3arUkhdB1auDIHq+AK7j4CDjrWHacZuf+WqWyb0oeON8aTZ
         keCNgqmtdFmUjwB0H9YfO0PxqCVmEHhk6ZH64gOg/g9pHwPlOeqxRi5kCYE4B0hYHIR6
         R0wNAnvI85Hg+MRVLUfD88IOLwGhRE+3AN6fOhY/Gi2LioM/bCrxk984lZiMyJmV2r0D
         QVQR1R3gLxCKKnkjxlYQWg/85eaDcmYiClqpzv/2dnuC8vZONjxSyZVOl6s3//HOJb+O
         TtGA==
X-Gm-Message-State: AFq9FYLgQQATsov4woYkqvAeeKrAG368XMxH4nFKWZYdcrlbtCdwQmIJ
	Ji/jAap+wuJkxm+yh4fFoXNTwesHwpm6376Jwaz6NpxDpkC++5q6EN5e91VgGw==
X-Gm-Gg: AYBFou2Jr0HTrptc+HxrEm82jaZWMpehojxGtnuSopG3R/8vDUlPLhuAxDVHsW91hFJ
	5/28aWszozOx+tS8cvTU6/JVQcpVK1clpqnbej/jGsIKS+g+tIK3qLNCtUkUvkr1BOPzrAuNagQ
	Ivg2OVs3skX5Qh+Tm7IXRmR3voH4w14MzboOagdYWp5loIBT3uoTQ8ISBrO1AF/TNyO5VJ71vkI
	zit55qMH4wRbQHr5Tjv9SPYAsWxyAth7z72NyAnprSrgTtQpen/Si9+8MCyLmEMBLWDh0VyCHx2
	jFonNuwEzaYEpEHIkoqz9YBxA4ve+wI5jRFzZn90vqF868yy9/2utGHonCshQPQpPnMssv0EJmI
	n9XaPWeI4BTMRK2ieZmnkPd6D9jWoMcvGiXUGG6oXC7eg0l70iRcNuCQGLT/tMhtVbMH3tdigOP
	umhBIc9a8LjkNZS/wunH//L8+caSujumWVqC2PpFbP4gTcMc7YHoZD45gI5PtCuSRLd3+LyLzlL
	gGEt6grED8G
X-Received: by 2002:a05:693c:2184:b0:33b:9540:89c6 with SMTP id 5a478bee46e88-34f150a0140mr1465702eec.6.1790914102382;
        Thu, 01 Oct 2026 21:08:22 -0700 (PDT)
Received: from [127.0.1.1] ([2804:14d:9ea1:8718:27b5:8987:8e28:81fb])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35105dd1dfasm492558eec.8.2026.10.01.21.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 21:08:21 -0700 (PDT)
From: Leonardo Martins Martins <dev.lmmrtns@gmail.com>
Subject: [PATCH v2 0/3] staging: rtl8723bs: refactor
 PHY_ConvertTxPowerLimitToPowerIndex()
Date: Fri, 02 Oct 2026 01:07:34 -0300
Message-Id: <20261002-rtl8723bs-tx-pwr-limit-v2-0-48b180fb6f7f@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAYuv2oC/3WNywqDMBBFf0Vm3SlJBOt01f8oLsxDHfBFEqxF8
 u9NhS67PAfuuQcE59kFuBcHeLdx4GXOoC4FmKGde4dsM4MSqhKkFPo41jdV6oBxx/XlceSJI1I
 rSWvqSEgHebx61/F+hp9N5oFDXPz7/Nnk1/6S1b/kJlEg1WSNNlKWnX30U8vj1SwTNCmlDyFiI
 6G8AAAA
X-Change-ID: 20260922-rtl8723bs-tx-pwr-limit-9a19bb9f901e
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Leonardo Martins Martins <dev.lmmrtns@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790914100; l=1760;
 i=dev.lmmrtns@gmail.com; s=20260813; h=from:subject:message-id;
 bh=DINkjq05zx+pWUD1H/kC0SeYGjB2tuKtoVlRFcjbv30=;
 b=SYiNR+UldcO66hyDKNIhAjGTxH2eguwPkHW2t/Np5ErNgsf9v6BTrrFkxlMNG3l4yUqH1i60q
 HUHXQgtUhfzDNRzMttOweWq0Yjxqck6IbToHgiSwDXMZ4PIix2D7uuU
X-Developer-Key: i=dev.lmmrtns@gmail.com; a=ed25519;
 pk=dOFSCpUL7hbyVftAaUGDebsgsSl9Uk/Tx0Aqpd4Bcng=

The function PHY_ConvertTxPowerLimitToPowerIndex() has several style
problems, such as mixed-case names, deeply nested code, and redundant
bounds checking.

Patch 1 renames mixed-case variables that are on the same scope as this
function, struct fields such as TxPwrLimit_2_4G were left as is. Patch 2
removes redundant parts of the code, and patch 3 solves the nesting
issue by extracting the inner loop into an auxiliary function like it is
done in rtw_phy_tx_power_limit_config(), at
drivers/net/wireless/realtek/rtw88/phy.c

Checkpatch issues a few warnings and checks for deep nesting and long
lines, but these are solved by the last patch.

Compile tested only.

Signed-off-by: Leonardo Martins Martins <dev.lmmrtns@gmail.com>
---
Changes in v2:
- Rebase on staging-testing and drop the patch that was already applied:
  "staging: rtl8723bs: rename PHY_ConvertTxPowerLimitToPowerIndex()"
- Dropped these two name changes, keeping the original names:
	regulation -> reg
	channel -> ch
- Link to v1: https://lore.kernel.org/r/20260926-rtl8723bs-tx-pwr-limit-v1-0-989dcbc113fd@gmail.com

---
Leonardo Martins Martins (3):
      staging: rtl8723bs: rename local vars in phy_tx_power_limit_to_index()
      staging: rtl8723bs: access TxPowerByRateBase2_4G directly
      staging: rtl8723bs: extract inner loop in phy_tx_power_limit_to_index()

 drivers/staging/rtl8723bs/hal/hal_com_phycfg.c     | 87 ++++++++--------------
 drivers/staging/rtl8723bs/include/hal_com_phycfg.h |  3 -
 2 files changed, 30 insertions(+), 60 deletions(-)
---
base-commit: dbc2fa996f44602af72ea56efa68c043407eaaac
change-id: 20260922-rtl8723bs-tx-pwr-limit-9a19bb9f901e

Best regards,
-- 
Leonardo Martins Martins <dev.lmmrtns@gmail.com>

