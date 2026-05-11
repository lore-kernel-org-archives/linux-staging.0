Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE45B4C0428
	for <linux-staging@lists.linux.dev>; Mon, 11 May 2026 18:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778525614; cv=none; b=fEmveCxsI/PjqYNpuJLlYaNlYXIpl3DHcLk06T8xlC4Hzfmjeg2FyUqHNPy3/wehzTNGN1WP597a8oV/cD3lv08ICh1xD4ZTpoz+LgUGDLzj/dyKHWT+syeFZ4G4l4Dk9TjMp98RRV2TKRLMQiJOKxIEDAbPjrECVMLW+i9aN2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778525614; c=relaxed/simple;
	bh=tE2iC7sszpnOcuH+niYxIh4RC5AK/cK3cnC8Y4kBU2w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ug27dLZ9QtY/k4rPTi1RG+SNjWNwcLiECqBufHAtkj/+bbTQAOQjC7VD7I4zrAHSyXcBTXnMBSkOmj9CXiQoGqPLfcVVfcsTyx4sE8Th0CLG1a8LKBc6VtLri285+o1G6YeVbPq/yNGTirwKwB4D5aYGYhE2JOzdoIOGiYobJbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y1c9i3jX; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y1c9i3jX"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-bd01481e592so160752066b.2
        for <linux-staging@lists.linux.dev>; Mon, 11 May 2026 11:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778525611; x=1779130411; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1+zl/w0qMjkIyomblrooy7r7xj3W1V5Sk1CtAfoGnuo=;
        b=Y1c9i3jX3pKIWNrtbI8FZlZc55t5Nd+oxNbF9CbgbqoFS7Hrzls3b3fuo5/+0fdMVB
         CAjdq++qt6S5kCdtn+nV+u0bFD/XxwGfQFs2+gFWfV/AHwfAFGSuEWu/g/tqyYITmLqe
         /hWKOIm1S//bNb5B3GiRIQff+ZD6WFtFAOLkotAi1Wbn5drpzUSiYWtTA8p4MID5x5Pp
         ttHcgEKGKWNYk3W592hJTtb+ruX0KUOdgp2F5q0IoQuqlnPHkBOTeVegc17qdBexqnMi
         9Sz6L6pSOhAykMBiyOMTtJ18ex7w3rCKOu8y2XWaFxgleYrg4/W35MGS8/CpkEAf01Sj
         nxLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778525611; x=1779130411;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1+zl/w0qMjkIyomblrooy7r7xj3W1V5Sk1CtAfoGnuo=;
        b=RXk/C3XPOcHN1BkNW3kLdncUKMjqNZFlvYAGrfttf/YCbO4fdRkQ9OYc/maZj71aJC
         d/xdJMJrlFakwQquQ4HILCOdTLJwsH+s5sqNMPhskQRUYGQGy62dZDcUEcTESzMrYoSu
         z474akic6Se0B9/LuJNTOv1WT1NMEXY9ZFQcC44vPtLVEqiPbkCH4Bq7tdhce1THOBte
         H8o5WhcwSQ9cew0JDfLCLJWwsFWCfnZ0GagcVL6dOI9sb4WI0dKLzRYrkWq84lNCns2X
         viamHCCkPKC58n3zzdqQyKkfFMa4+2OCggjO4WoxQFQKAln2G+JxAJXSw/34TXns96p0
         hk6g==
X-Gm-Message-State: AOJu0Yxk8KVvciShq/7oSj+m6t5DBRbWgrC79ROHabjnC+SVTsvHpm93
	ioP+s7FoNrdDeP91xYwLcFqDM+znomWyCGEpcgxVp82icex23kyHuHx7
X-Gm-Gg: Acq92OEZCtc7+nzqnsXXeonglggxONCbRGuIKNs6IkgaMEUTcNpODMhRzFZsD+4f1GW
	Zk4KL5l+IIfmsbteJSEjzg2K9MmlHf8NBkINZUEIx/KqONqYkh8dWrI8eaBb4uyWj79g9t8Zjr1
	XIPQJvlX9f3vCxnxAL5CE73us7U7OGBchjcjjjwyMsb0KwQ/puWKP538pzeJ184YroLEiV0IGtj
	hu1gtQp+/zr1tCkBCFGrowkvSKdINQl/qnt2NyZO7nCA5P6tdAqt+DPylKl/l5rB+AD8boVahp4
	yUxfAjMbAbt22/rpED1chcqLdMEZL/ClgNTg8i6BAYBDD4/BPWB9S6HCARAFONI6R4H10jcbDiO
	+6TMCUFO0G+bJ+g7r99mwxYWVS3oLPcIMc+iDlN+FFih7NI9M9EfYGYTou95QgGq+Qry9kQtqmY
	BJmV94CwhvF8QdjKEVkiDegGa/9i02PmzzXq3AgD8ekxVbFe/DqLT8zgWSFZR3QWqMEKjQ+TtT1
	qJp5KM0GpuLeWdFOmFSv/Mza+bo1hfjZ4jqiZFWmpc3HvxNmQKYXPcg3paAiuGTDFaapgW1mZ3F
X-Received: by 2002:a17:906:f591:b0:bcb:e626:522d with SMTP id a640c23a62f3a-bcbe6266f56mr742606366b.44.1778525610797;
        Mon, 11 May 2026 11:53:30 -0700 (PDT)
Received: from ahossu.localdomain ([2a02:a420:22d2:4061:8cc7:b361:391f:af99])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bcd7bf48623sm310803366b.48.2026.05.11.11.53.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 11:53:30 -0700 (PDT)
From: Alexandru Hossu <hossu.alexandru@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Alexandru Hossu <hossu.alexandru@gmail.com>
Subject: [PATCH v8 0/1] staging: rtl8723bs: fix missing frame length checks in OnAuth()
Date: Mon, 11 May 2026 20:53:13 +0200
Message-ID: <20260511185314.1625375-1-hossu.alexandru@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v8, addressing the sashiko review comments on v7.

The Challenge Text IE checks from v7 patch 1 and the OnAuthClient
frame length checks from v7 patch 2 are already in your tree:

  9d6d63cf3c37 ("staging: rtl8723bs: fix heap overflow in OnAuthClient shared key path")
  6ad4395aab1e ("staging: rtl8723bs: fix missing frame length checks in OnAuthClient")

This single patch adds the remaining fix: frame length guards for the
AP-mode handler OnAuth().

What changed in v8 (compared to v7 patch 2/2):

  - The len < WLAN_HDR_A3_LEN guard uses return _FAIL instead of goto
    auth_fail.  The auth_fail block calls memcpy(pstat->hwaddr, sa, ...)
    to build a rejection frame.  At that point sa has not been
    initialised, so goto auth_fail would copy stack garbage into the
    rejection frame's destination address.  Since we cannot build a
    meaningful rejection without knowing the sender, return _FAIL is
    the correct choice.

  - A new guard is added before the iv[3] key-index read inside the
    GetPrivacy() branch.  When the Privacy bit is set, the code computes
    iv = pframe + WLAN_HDR_A3_LEN and immediately reads iv[3] without
    verifying that len >= WLAN_HDR_A3_LEN + 4.  This was a new OOB read
    path not present in any earlier version of the patch.

  - The len < WLAN_HDR_A3_LEN + offset + 4 check now sets
    status = WLAN_STATUS_UNSPECIFIED_FAILURE before goto auth_fail so
    that the rejection frame carries a defined status code rather than
    whatever happened to be on the stack.

Alexandru Hossu (1):
  staging: rtl8723bs: fix missing frame length checks in OnAuth()

 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 11 +++++++++++
 1 file changed, 11 insertions(+)
--
2.53.0
