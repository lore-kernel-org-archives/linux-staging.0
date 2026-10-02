Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FC8247532A
	for <linux-staging@lists.linux.dev>; Fri,  2 Oct 2026 09:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790932685; cv=none; b=nZBj2hSFyrniukSBPvBjakva5HMDgl2kbaNJRZGpss1SWn7/udIaMs3qBUp3NSVg7bTiwlYi4XoO3ZnjGDQvFVyEiIXc+nnUd07A/9xCXU2BRws8ZFsf8OohQlYlH7U+Xnsm2LhpVrP+J9XB+K1+8uXAH5Ea6SZ+UtFBRIFSBmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790932685; c=relaxed/simple;
	bh=IUZNf3fno5D/v1SQtKkJJtC39+JBzebyE7h56078Jj4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PpNbSoWzffp5jPnckXOhCmN0OKjFhOiRdKv+Qvc69KPAlNhM6T2Mq1wC4Lnwc2Am321JSMrllWKKuXHNGJliR1BH9VJvkCtBDlCcVT23kvdOtCvH/ehlRlNQ8GKGNUvBqDopbpMt8If0x00sfS1b5jY0QEA1tSYgZhV1DgPDPyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nEi+EeuL; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nEi+EeuL"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f63546c3so5798343f8f.1
        for <linux-staging@lists.linux.dev>; Fri, 02 Oct 2026 02:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790932682; x=1791537482; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H0FcRb8OTX7/GhAedNNsxuIjIt1hP3QdH9f7yijnG/M=;
        b=nEi+EeuL+PbUylZSijP/tZU2bUwp3PV3XyaYkil30zJJPQDwgxpISXVWycH/yGbZu6
         m5Ft5MnDxYhXa/zA9bsJ/EN1EeskaS8VEe+vPYEfG8gvIcklgJAuqjDGxM6seYaFYxTh
         MWcuqWlSGkdu70mpYsmDkf47olMYuhHB4OGa34MihDGuME8aO1zOzRBMYdrO7BvJ+p6x
         SsdLuz4Lj6kZjZxQ8o27OPvU01kkX8Kjrm7dwB9Swo8tN8NIHjoB2XB/0nZm47rEZULd
         eb9zmI+as/Ai4gLL9pS7EqA0SQHGok8K7ErJ25soa+9H7zsNq1H0WgCkUKHbBDpHld1x
         8vNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790932682; x=1791537482;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=H0FcRb8OTX7/GhAedNNsxuIjIt1hP3QdH9f7yijnG/M=;
        b=j0glqFfrdyV7+KwzyTiZwcFi2+KfSuaSUgNomwqusp7X1FRuhjoq285ipcYj+kxkdh
         N6Y3UF3alb5Noopf3EHEOOwcBj7lAji2/Wlyi3aI1BG8xWoUbGfhSQ2OwqO5srjbJWTN
         Q3hJfiDfQ97QVkaMLi+qkzBJAdQ9VtcpzVxdUBc+ffW2kAS9zaWeTgPMTXQ9tAFEo7A2
         MzKx/19R6hBEEVo7e6su44EuIi/UoYfjdtOmPogxcuccKLV1e78aHxWYtekoCE6EVvPd
         7jNxxx1VDgmUhjEGR5IKSTGhq/eObPmcN9eNkwaaS/lDxAfOsJifH9oDLppI3PgT04nd
         V6yA==
X-Forwarded-Encrypted: i=1; AKwUvBzMvD3/yhEw67yfyjH0XN2u+iOVltFIWiI/I29Zwk7Df0MKMaW01upDq7uWR4IaPYvZM3HTxlVdUkR196Lx@lists.linux.dev
X-Gm-Message-State: AFuF++l57J6UoUAI4WK2CLoqaAFktzs3nm0792cMFn47YbRtl/F/QAGU
	30j0jCBZwKWC7faJjC5ZWJ+CnZ1OVGoCkXrj3tEQN0aJkWVNyTzGjf3O
X-Gm-Gg: AYBFou1EFyW2o9KWF/BIQnNEM2/oj4LT6V2clwnKB0XbCQ2LBCNsJo7N/GgHndpinmJ
	6Uw0exjs2sQLSSdjV7Cpx0+4Brq65bolRhpVSiCOhHe7OzTQw4E55Qi8iSmURHGJitogXPuscOZ
	rdLux11KXNW6ey0w/B31szIe6K3HZVIeqPReQ+Z6+HHE4Q1RjtcP7JZ4+KrqKYbWcUNTNyGveA9
	d4917pQcaktfI6RCshq1ZKCvQViVzFUw/AcSlrnIFJ1rqeGJygE1T9M2bkSVGIdFdf9w1Qu9Rcv
	p3tWlZud8uUUR+gSlnZGv/CL+gD86WhwbtK9HHOA2HaP3+a5hjNtbnTNRBt0NtEj8LfsX6vhp61
	h6Bw+V0yRF3hbdVbErI8GmJ9S+vAp83/TvAAiA0bK7EA8IPHBBc9HINnl9kxkA69wroEXYzpm4J
	AhSd3+iAkc+vTG5TJHuN8nSMTln0hucgSHjHjOmL/N63CebzmWbrdRZB5x1TUlcNLWBBOJtySjH
	WK6Sn1HqSgmhiz4MbuVS2cEXEi92tTA45w9L27J0kWSUK/IGwgqk27CHIY=
X-Received: by 2002:a05:600c:8b77:b0:49c:fc6e:8caf with SMTP id 5b1f17b1804b1-4a027564df4mr36860205e9.19.1790932682063;
        Fri, 02 Oct 2026 02:18:02 -0700 (PDT)
Received: from 1Z10 ([2a02:b123:8010:a99a:44ac:6cdb:a419:601e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0280b2e3csm77717755e9.5.2026.10.02.02.18.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 02:18:01 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	mchehab@kernel.org,
	linux-media@vger.kernel.org,
	bingbu.cao@amd.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	andy@kernel.org,
	hansg@kernel.org,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 02/16] media: ov8858: support 19.2 MHz clock and CHT gain setup
Date: Fri,  2 Oct 2026 11:17:59 +0200
Message-ID: <20261002-media-v7-p02-andy-reply-1-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <ar9Z1Zr-deCCQ1nx@ashevche-desk.local>
References: <cover.1788360629.git.mauriziocasciano7@gmail.com> <628adb1cabec866554ca26a2da5af860b04d6cb1.1788360629.git.mauriziocasciano7@gmail.com> <ar674__4-cNOGMMy@kekkonen.localdomain> <ar9Z1Zr-deCCQ1nx@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Link trailer was invalid and has been removed.

I also corrected the disclosure to the documented form used by this tree:

  Assisted-by: LLM sparse

The clock constants in v10 use integer unit macros consistently, including
19200 * HZ_PER_KHZ for 19.2 MHz. Patch 2 now uses 24000 * HZ_PER_KHZ for the
24 MHz value as well.

With Best Regards,
Maurizio Casciano
