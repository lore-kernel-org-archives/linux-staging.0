Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BD5A3A2E3F
	for <linux-staging@lists.linux.dev>; Wed, 20 May 2026 12:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779279686; cv=none; b=U1mIbLNqaqesIb/q/2Q7SrT/7X8uiB4Avtw+ZqGuWiiWeRsNwkl8Ql42BzxXLxWjL6EmFNUlwNNflQSDwsI2M78/peGYYdzkk6iKoos0mLcXkuQQsScvY1zUOCoftaueLJ1APLeJcoOEg0DKD2XVUeBMHt03s4j8wZYlE0sjYd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779279686; c=relaxed/simple;
	bh=TAuvyYudARAkHTzjpNfFTMQwQ0je0Xwjq+y2av6CwfA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TET9R85SNPIrcoNIyEHevyaXWY54csIrRSPXaq1kiCFhd7lwrYzfohc+F625JlY92JD+jbZctDVMqmYrGbea0nGJsHtdgy+GdrEZRV3ftsXxvKNHgzrGRc8bNwVReXyx9aaeen/vA6Vr54dKC4anjxCtvfk+xqom03gok2rLXtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jiMHFIVQ; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jiMHFIVQ"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5a8e387baaaso401182e87.2
        for <linux-staging@lists.linux.dev>; Wed, 20 May 2026 05:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779279682; x=1779884482; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TAuvyYudARAkHTzjpNfFTMQwQ0je0Xwjq+y2av6CwfA=;
        b=jiMHFIVQvL7V47aufrr/7BWy/pRXhmWrS4umgJzLMczDsMioG+MdwVxjd1SwvuUdTj
         /3iIDZvlCNZaTWmMB8r3FbFO1iLltftjZ7f50O8B+0s4HQg4NO1s7GMWRJXmnNnc1pip
         fHre8Xp2TQ+kUNAUMU6iEeiAeQa2Ugdg/RDR3SgDjjiSLsXr8QbcNhlWpmwvXzuAS//6
         SPW7pno3UCJ49h+ysNN4r3ED60um75x0v5Lb2tmvmiC1BGQfuwoY97uis22mRbH0Tq5G
         c8rScz8ibOKFZGcHWSCaD2i/VYbUSG29esfAkE7lGOMdwdVGLqH7Zq7voFyLQZc7FA97
         FQug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779279682; x=1779884482;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TAuvyYudARAkHTzjpNfFTMQwQ0je0Xwjq+y2av6CwfA=;
        b=nGYyMzL50gVc1+NVejBlT/OIh/KxO2oSDHzwK5gRSCNzwlyLmMDXLqdFvR9BVFtRvg
         EY2Rw0YNPPnSrNlLGxB24t9aQ9BdQOBxEcSF5RvXqVMOdlRSwEkDvjQtwVVG/z9RCA5n
         96F8Mw6ZH3U33R9424/JlTPjmBA5eD8ncKG3jZ8vPK8jp+s3RdBnEQWJVMdH+kKxAJ97
         OPxdxn2tXJknMhdX3/pB0Tsr5PHwZLd6CAznJCICuJQ2EQTmFkLZTXPFMqWaf9W4yg3m
         GCyUzyDVAjUSsR7hlb8+8O4FvBQsdCas9lbpH8c6IIE3GR/mDbIhtWw79PZok6T9Oe77
         I+6Q==
X-Forwarded-Encrypted: i=1; AFNElJ+nWl3H2TtNvSlE3oHr7XQUmQ3vv4GW9/KvfWcy+bo88CgFsf25NCKRsSTyFBE+6KPmZF9yz2Lueg9c8hF3@lists.linux.dev
X-Gm-Message-State: AOJu0YyK8tY54si4DIXhqy8GzO5XQHKD+g0fru8YfrvSbJ994wYaOF9b
	BBAuC932uHBBTyO7LE3R5sE5W+Mkwkzr896YH5EXEeeKsH5g/k0laYBy
X-Gm-Gg: Acq92OEhIWoEJWI4Ny06wSN/fOK8GinvXql3jHglCf+LDGwy8hbJSOy/MrjoBz1398W
	yLHk/RQs6T+uGE9MaZg9IE+K/EY1i/T9yYH3yd3RndJDh97oE1ztsgrIyYxCsBU6L2emclAL/Nv
	ndV2M577hV3l/ahHcd9BxsvYjtdO8sjEqn0XyE2JGrb+NiKRK/kkc2+IyT/k9wCjie9bVY6c1jH
	9WnNixEOeotpja4kq4lONfd2quTTswJe4AxeMepyONqi+2xCDBwoj+k6CpG9qr+f8VuY4TgZKwI
	i+FKW/PB1ONFrKFTvAiQOjQj4wF8QcyQK/2rb8pS76fswZfKdRiU4YxqLE5vT7Me/9vp9rp+UAD
	brwDWECcvXpN4O0ejNbsnoMDd0BFoYdmeBkKsghVLSP2PmnmUnOEfcHgJaBF3XT6b2bTp8IYwUY
	tTwwvJtPkdqSdPDEbt4JrilRfFkP7cNPTik+O4s/i7y4qCC4i0VCjgjqV6Tw==
X-Received: by 2002:a05:6512:2241:b0:5a8:6f8c:24b1 with SMTP id 2adb3069b0e04-5aa0e619d83mr3072457e87.1.1779279681780;
        Wed, 20 May 2026 05:21:21 -0700 (PDT)
Received: from localhost.localdomain ([213.230.116.218])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a91dfda34bsm4889977e87.81.2026.05.20.05.21.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 05:21:21 -0700 (PDT)
From: Stepan Ionichev <sozdayvek@gmail.com>
To: u.kleine-koenig@baylibre.com
Cc: jic23@kernel.org,
	gregkh@linuxfoundation.org,
	lars@metafoo.de,
	Michael.Hennerich@analog.com,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Stepan Ionichev <sozdayvek@gmail.com>
Subject: Re: [PATCH v1] staging: iio: Use named initializers for struct i2c_device_id
Date: Wed, 20 May 2026 17:21:05 +0500
Message-Id: <20260520122105.15299-1-sozdayvek@gmail.com>
X-Mailer: git-send-email 2.33.0.windows.2
In-Reply-To: <20260519140624.1585534-2-u.kleine-koenig@baylibre.com>
References: <20260519140624.1585534-2-u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reviewed-by: Stepan Ionichev <sozdayvek@gmail.com>
