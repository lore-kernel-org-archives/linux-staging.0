Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E45383C584F
	for <linux-staging@lists.linux.dev>; Tue, 29 Sep 2026 06:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790662100; cv=none; b=ATR08LLGWZlmbfPjYdnnMuQSpP1MtzIrH5ewboRNQb36RApIG/7qkNcRl0MEYJ3HrSfc4auBkG+PR2OMFjJWqCua11hPUb8mhYCWwh1RX/bTQaTvs4voOgbhbeX/145nQVFUlzowUBm8/4Rynf56QIMxMpYcb4vCKnbyvdyElhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790662100; c=relaxed/simple;
	bh=+1nqsj9H5H4eMiTYvWq+JgqtS1aF4n2hF5KzkhNqrNs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jlaPFNhd7Pg350rVlloBTf6NCj0Km1WD/ii+J009MWo0IX60fj6i++noCy+TeCSfLGhHsNJBVTt1CznPVvJnsTHPK/XsrYYXXqlsIIw/K6gESvl0XEcqYomC88Ck9lYmX3qY9cwBNWDOfageNoeC2RocRmbOzv/WDrqu4VC9/W4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OmAjL7jv; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OmAjL7jv"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843378fb37so2221552f8f.3
        for <linux-staging@lists.linux.dev>; Mon, 28 Sep 2026 23:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790662096; x=1791266896; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+1nqsj9H5H4eMiTYvWq+JgqtS1aF4n2hF5KzkhNqrNs=;
        b=OmAjL7jvRxW8sWGss6PeCgPFknvBKmNJjnsdAFl3GbqqDXbNejUTvqrHrKYEa9Cp5/
         /0GAHVWYrGp2PMAoiILJ116vzjaIAvVcrRc1aFPLPeIt/ag37IkPdxXDJEX/YtPVuIT4
         L/EK9JJWg/L8B8gp1P0LpAGDyMspQ6VFRrzz6h7dH2QGBswiMtFgeF7+nIa3jY64+1kN
         l1Q7viKbJolXDibmJOrvxS5zps61ociJ/FFxO2lrt0em1kXJMqXRvYxWfhkTNJXxCDdh
         5BVWUa7o1hyLcrIBiwMEMAxo8+VeswtbH5c/IU/tGyl1p7pUsitBSomaqPZcEqalTGgQ
         2jJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790662096; x=1791266896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+1nqsj9H5H4eMiTYvWq+JgqtS1aF4n2hF5KzkhNqrNs=;
        b=Lq/pXvFXOc3//EDXmTsx/fAKUvFEZnqzXNQRvsklMCJjCJOXWE43SwuOqblkNEQanQ
         v212cchqb4Qf0zegknut1Kgdhua5Oe/8Z6HFWrfyiHwr0qKK44Wa3h/PwtAHWqrXmDkj
         GvUhr12qPVLixh8dxVKFouRWlFxLc8Ah3D4QcGHUT9fM6M8cZeFhXLPfcSt/kkRLfvq0
         AV3BEJzB6s14DdzRCmdQ1V7Jo7Ma8fCcRm7/gsjcsqTQqc54pG0M/WPoqoNC4XzpXsN9
         3YlNRtTNKO3SVrEwCuhhpbj4kGpqGSK8jwl0gGXY7tj+zNPDo9ahn2lAILyGR76O2QkG
         iixA==
X-Forwarded-Encrypted: i=1; AKwUvByM4N4d4UYYawo7u0QWliJFvmMy7iKrF4o/TA061JXjTuRABbCewUVEmpgmUNzfj5i//8pJPe6XxmR7lFiJ@lists.linux.dev
X-Gm-Message-State: AFq9FYJ1IhW7eJK16Ax6YFvwxO3Py3XTNZlphxI1hR08gFXJ4sidZPEH
	qUocYfe2sTx+SVcxm7CySVXfZ5bwznh8QUTAEAO5p+ePbzbSm1DFne+5
X-Gm-Gg: AYBFou3jxdE48UUuft1qHRef1pTh8uv0SsfqIkWg7pH1Ae8Pfp6z8Z1Y7BHtXQ77lWR
	sV5LXOztRH/kujSPrR438fykm2U+e/pwozIW3KKOytFAuNhjQL4N/vtAPhISl8Aqzhz+NOZXjyx
	8Kv9RoU5alRGFzEOqpMouwAsr4sJpn7C7tPj1i1HJmjXSBEGZhdoYbLz/HutzSvZacGSugSkfXS
	tEBvaR8dTMQ2ZGMuvDxWEZD7gSo56bQIeuYY1DI17YKON/OERhzQ47Ult/7YP4SJpXhd/kcAtv5
	HsiFr0uuUcVCBXSPUNXA7b6LSwwpS+odmhgwhx3MHnc9v1R2aGted5Wna6cAzKNMb5vqfVQkgsO
	xln5vVAsn2klgigyctaQwaJNNObhUgcmPCC7zzcw3hFHaxm4EGpp5FnrkLinMOx2FDDvgyUw3nf
	sSMf0Ok+DL+mxPwVLeSZO1lufhM+N7ncoreQJs6hvPhs448iQ6jLHEmxw/NasoOUD7hbRjulJle
	uoL3PMg
X-Received: by 2002:a05:6000:41cb:b0:48a:f511:e40a with SMTP id ffacd0b85a97d-48af511eb10mr783882f8f.34.1790662095984;
        Mon, 28 Sep 2026 23:08:15 -0700 (PDT)
Received: from localhost.localdomain ([62.56.221.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48af4e8a332sm1628730f8f.0.2026.09.28.23.08.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 23:08:15 -0700 (PDT)
From: Michael Freidkin <freidkin@gmail.com>
To: Dan Carpenter <error27@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-media@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: meson: vdec: size capture planes from the aligned canvas
Date: Tue, 29 Sep 2026 09:08:12 +0300
Message-ID: <20260929060812.2041099-1-freidkin@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <artQxRR3kJUv-mBF@stanley.mountain>
References: <20260928165045.642354-1-freidkin@gmail.com> <artQxRR3kJUv-mBF@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, Sep 29, 2026 at 08:46:45AM +0300, Dan Carpenter wrote:
> Reviewed-by: Dan Carpenter <error27@gmail.com>
>
> It would probably be more reliable to just ALIGN() the width and
> height at the start so we don't have to do it over and over again.

Thanks for the review, Dan.

Agreed. I kept this one minimal so it backports cleanly with the Fixes
tag. If the maintainers prefer, I can send a v2 that aligns width and
height once in vdec_try_fmt_common() and derives bytesperline and the
plane sizes from them, or do that as a follow-up cleanup on top.

Michael
