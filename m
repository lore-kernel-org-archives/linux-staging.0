Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 972E41E835B
	for <linux-staging@lists.linux.dev>; Mon, 21 Jul 2025 06:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753081002; cv=none; b=CFVXyQgXzJ5J9u9Qv2V7pzB58WfEwfLB9SJMoX7DsQ4GSjUKdtRFTdku8Z9qTlfzXlTDBPVvLg3mydaLhtLpeC4sOTarMKuU6wDGs1TwlViU1DqTL1vvZAvd0owNQ++kedSPfG9XhZjM2FqhjdQTQ+/FsFVzmMAFSss+0Y6QplY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753081002; c=relaxed/simple;
	bh=0DQBXq2HN/6qH+Y9jouZFed5XRHr7dG2MrXu9+Jzw9E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=caLiQlU670J8YTj1m+Z84MK98pCzf3nMWcEIJiDXoFxeHrCvArcGXhfyl5YQ7FQA1p4PyOA/DCPds9/dML14ttgm8RPrftEHJu08nYIJYRPK6DoIx9fFq0CKsQkHRA8xEPIaI80HwjbV18c0ODZTGO6/TmH2IB1BmHjSFlosGfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ncMR8rtk; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ncMR8rtk"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4ab71ac933eso32705251cf.2
        for <linux-staging@lists.linux.dev>; Sun, 20 Jul 2025 23:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753080999; x=1753685799; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yQQIZUQ7UmKmkjv2gej5jBDOs0zZHuvpMuMVygz6yH8=;
        b=ncMR8rtkWS+kS66v3pizSCxVimJyAGHCD65BBLYhUeSL4ifq2nkVHpAja6gV1XX9Ke
         m5e9KHYO21pxRrcwyBd7qzyI4+/ktTF315X/bFf6UGYkA9miXgCjQZTr6IT3rmXVVuPW
         y2xxxKb9u7LcFuzol2vxW8JbsJUCaDjKEzmKwDm4fzWpinsT1GCiPjQUOoZMRbRp7hFq
         prTkIlO1Sfdllb4Pl0KisIMBgoMhOSNRdQS3LpNjB61VCkYpsrCE8ws/BAJFSMo3WVtP
         HDKHgpOJPKsfbVlB98DQdGu4PNe+dWXn1DdbJjhbwJsRCXRvTdLQKuFw/WXgXUd26na4
         YeFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753080999; x=1753685799;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yQQIZUQ7UmKmkjv2gej5jBDOs0zZHuvpMuMVygz6yH8=;
        b=rNERIKkgBZcUspJ8zI6+KyRNe61lgCrhaFQXAqald5hmsRwPCIu2u/zjIVT0UUpZiF
         XJLjO+AA8qzDeYhdWm0NJDbmXsthJP6bIy4ngLcp+KDQNQ26EYkUeK4kSCaEVWzfo3q9
         Z0OpUlyYR0oc09EOZDRGeXqXYbINtUE+RicGu/3md4KQzj0ahUD/JuE59/ocK5KZfbkN
         I1CgYbDI5e1giwhRGFypA3R64waK7OZF0OW8K2mAhNsviA5N0Ahqob1bZTlbalxe2Qau
         cBnxmuYWPUTjskiV9rehOue6YxFC7RvJ2kegkLnniuohYnp25TnTMgOi2rlQFibF6GzA
         ip8g==
X-Forwarded-Encrypted: i=1; AJvYcCXpzcaJaUemn8PfHB9QwpMbm7kxZpuM1ct4GHBpa9cypuTYnbeXqTb8lvTmGng+X5TlF96fURo7zq+Qw+O4@lists.linux.dev
X-Gm-Message-State: AOJu0YwFeK729r6IAc2iGBj+MdDv+FsOmx60Y3yMRW7kxx0hO0Umwn83
	itVuplbZTRhYMC/KH57CGA+bNWtdkxzWOYFxiBtvTWw3dXQmR4SubuXp
X-Gm-Gg: ASbGncvN9qf7HuJ4+g5w7boYE04tLM6Une4VPPqpAX4JVGaPEb7iKtsYJmYZBRuqYsk
	fxOap0u4EQXzRQz5c696ieF2tCuxcJFOhbDaPoZDuFUGvExN/Ti6W96jW3HcQKHM+hky3/CDWYz
	3Dsvezugi1w5ld+u4cw4UcFRri4H95PFjzSBO2Zxw/1ok9TH/slWLNSKdvVd1DI6ofyLrkKznGW
	OxZZvzhbQThKXtLh6r48VyuExQcXHdlMiy6u2BH0dWatlfx/SNnjcdKAUxg0SqnLZcleIM4Jef9
	giGdJ89AmU9mVsiwKxEI4YkDNrPQIP1gWxwHSqXhOxAIK+WBRR/W2949rFAvM+IFZKKp8eOjJn/
	N2uW7t8up7cGRGQGi+1gPo2ETMuxcuJ7HFjRCQOVOEuZJa+S+HAI=
X-Google-Smtp-Source: AGHT+IGkllGgVq7+POAScPebihOJ+wo8Yd03YccxYtdX0vB/pY9isPBmAYjxxVgNa39x+HavQXdN0Q==
X-Received: by 2002:a05:622a:309:b0:4ab:a8ed:5be6 with SMTP id d75a77b69052e-4aba8ed60f2mr318058371cf.39.1753080999367;
        Sun, 20 Jul 2025 23:56:39 -0700 (PDT)
Received: from linux-kernel-dev-start.. ([159.203.26.228])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4abb4af44d7sm39127791cf.38.2025.07.20.23.56.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jul 2025 23:56:39 -0700 (PDT)
From: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
To: vivek.balachandhar@gmail.com
Cc: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v2] staging: rtl8723bs: clean up redundant & parentheses
Date: Mon, 21 Jul 2025 06:56:28 +0000
Message-Id: <20250721065628.297870-1-vivek.balachandhar@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250721061412.297554-1-vivek.balachandhar@gmail.com>
References: <20250721061412.297554-1-vivek.balachandhar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Thanks Greg — that makes sense.

I'll break the changes into a properly versioned patch series based on type and resend the v2.

Appreciate the clarity!

Best,  
Vivek

