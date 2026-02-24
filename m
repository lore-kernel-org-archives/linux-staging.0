Received: from out-173.mta1.migadu.com (out-173.mta1.migadu.com [95.215.58.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 557C339A806
	for <linux-staging@lists.linux.dev>; Tue, 24 Feb 2026 13:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771939651; cv=none; b=tT1pFiIl7hLL8LM9v6TSH5xQViHSFqKK6sO1kuvWAdFMimp+jGORJn0ERUt13tcuUn1TkFW0xQtMuI6l3VwEWLEZFWuQUUYYA2MoYuWh7FiNsV/U3CWsyL11KhTYuJtclt5rHVzIkikvrZlvylRIpj0MMwS2kUFvmDXTxnIEfkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771939651; c=relaxed/simple;
	bh=C4pANxUVCJFZrBeyoBWNVdr0fJa46gv7uPV5OoxUBNQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oEZKLxtIOj6shHcZaOLdrc+pjMD/s95J7e/+cZszgtn2c65UNS7ypSRN2wgCwt57N2ztgh75nQzub1flMdldSzU9U6GjdkawV9k7cx8ufaLYcKOY0gWQ3UmXg8XKzINOIlZ9nzO2qFBXpG1quSXZuPtdhEzbhgE5N/Sxi69ptXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=v1/OMVy/; arc=none smtp.client-ip=95.215.58.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="v1/OMVy/"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1771939647;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=5F1JvPl82ujlHbDLJCtZjUeVau7SvFVMFb/DZK9peNk=;
	b=v1/OMVy/9kcdGi2Z1Bxl9qvQH6py3a5R1lFwFfS64yPhtRm00kb30Mi8Uj+oPfFc07AjB6
	uHNhgQFYA4ZjSrN2J31XPlYnnJJfLq9GfMLecbwB2mO47TGSUkTPnht4IT1wrjcURSPhcB
	j6gCY95zDj3syJ2Fm7mC1kWSv/lpSPM=
From: luka.gejak@linux.dev
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Luka Gejak <luka.gejak@linux.dev>
Subject: [PATCH 0/1] staging: rtl8723bs: fix potential out-of-bounds read in rtw_restruct_wmm_ie
Date: Tue, 24 Feb 2026 14:26:46 +0100
Message-ID: <20260224132647.11642-1-luka.gejak@linux.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Luka Gejak <luka.gejak@linux.dev>

Separated OOB bug fix and cleanups to 2 series per Greg's request. No 
logical changes.

Luka Gejak (1):
  staging: rtl8723bs: fix potential out-of-bounds read in
    rtw_restruct_wmm_ie

 drivers/staging/rtl8723bs/core/rtw_mlme.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

-- 
2.53.0

