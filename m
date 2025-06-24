Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F9992D663F
	for <linux-staging@lists.linux.dev>; Tue, 24 Jun 2025 14:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750775558; cv=none; b=I+SX8WyO3R/gxmIasijA+vtaT+LppYult7yRfWKNIrS8K9DHxI+nZkFq9zMGUmPc6lqI1sVFm2NgL4C+JH9ThKpjOfM9ri8jv5UuOwIcNS3ZipwsD4xYVlshJVaOReqGsNb93j//lET2CMStFGv2nTaBSCdPiJIZbDBUEHCDJeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750775558; c=relaxed/simple;
	bh=OIig1hvOgr3Yfn3X9EzxrKMc25cjBmewUAcFdr2bDIo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UlcPGbOYWiF7oBJso/o+iRL2LnPc4eBlXXaqiEpMW768Jkb0DSQMUmjCo0d+9HGSpcMGseVC6VeYixnG3vwPoubkdrNlensqAgmmMWMs3pEFjvrUxKn8DR4U8sYhTJiiyP+9H2lJYqDYCS+TDsiwpzB+gd98JsZHvRKJ1spjG0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aV9bf6iQ; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aV9bf6iQ"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-23633a6ac50so7884555ad.2
        for <linux-staging@lists.linux.dev>; Tue, 24 Jun 2025 07:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750775556; x=1751380356; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j0T79Pfy96T4ZzYQAUwEM5a3O5d3tQvoc+ot0z1/UEs=;
        b=aV9bf6iQGVMLJ0ezsuLwhs432FrE+GlVFE0pjHwfuk6WenMqYZRJ6sTPxSzxvpFCnG
         B27f9PV5SYqagb+2qd0I8Ak5PT69sBkkjwYaGvmZGB9T4/+CLAkiWEIkr2uZkUmreU89
         Ckh4p9ME65x4ngqBkbmSuThDxl/7yWppkTd6rr2sIao3+0dMhukGT795kzxVtE/v1xAt
         R7eugAAqjNLT52igSBXauWECsoirL+p7vsFyoDkNSWnBPDtcI8+1mDtwv1UClltjjS4V
         UQB1/bAH/pcME2K/RsKQvhSX1jyYZU9F3A2bxG9O3ctcUSptfW0do83D+xX57HMPFDwQ
         w0Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750775556; x=1751380356;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j0T79Pfy96T4ZzYQAUwEM5a3O5d3tQvoc+ot0z1/UEs=;
        b=fg1bGp1CXQH3ibQL+jMJZ6pUZR6oAGB3CW4N3EdbOwkyIjt/6TgcTQqpXHaauuL87g
         sIzcUufzmEp0yWpmGZAPND78Mjy3tjWr1qYna9viIZQulQqEBplUPM1EUugHxpnYP+PN
         LOSHnIPn3yq57kLtLAY/0+AEM7TZqnRQJWzklzP6tacyJn5JOQAr9clnFAt04xBs71/q
         ywBJB3o7fwwYwsVzA1dFDWu81x62fA/+1WwXPb+GtJE0UG+BUYsrScymYqXkf131YbT2
         g8cF/jYbGg8QeHJo5tkr8wsl4nd6he226+wtsvkiwp5TWUD5QUfs9FBt1J5NylrdXdAn
         OQFg==
X-Forwarded-Encrypted: i=1; AJvYcCWoBMEtWC3ayhvVJTFeOXBk1589VYi4OSL9w0JCxP4LxMEDSc6NrDCXhRnPxhmj54gzzKRssGNLKvyoEr7i@lists.linux.dev
X-Gm-Message-State: AOJu0YwArXImoBCS1hpOzPwFWhwhI2d6cCoGbnnc9PeKxnABQu8gc2Xs
	RM+MOUFbJAOuJWEcSJto5gvLxRWIaKbkMhp5+hNibFafXBL5EHSaCsDJ
X-Gm-Gg: ASbGncvNNGiGpywnU9d3frwRU4YcVRw1FeIJQD8W0F6FWLqmqRGduYP7ou7Yxw4tcTK
	vWSaa4WH6/26ethUn+kLs5DFlraftNghhQ8MvSWvt9QL9NAPPzw7mq3KglPQma1/Dvfj39snoWM
	OwQIeT5haPruox+9GHom1UEK0JSyyr/qnsrRNE+68/h1S2scV0vY6bv4mJ3UlMYt+kHtPhQzxXA
	YHD1lLU6Cyv38ugeOFN/WsyCRRJ/obApEplpyX851e+HP66q5Kl7HYvMV9+5SgR1ywEFMommdbA
	qSREOa7oQXO6aw19NT/oZ4wVTX0AtT9371FQud/G0gWkKHfNEa9daNM3RzMAInJQ9eIHhBp5ODQ
	LroyY0G0oFe7Kc+k4T/8AL/VIniem27zhF61SYJZbM1NftxcXEw==
X-Google-Smtp-Source: AGHT+IFB0OcxXR+rMYUxcMWdJSDTc1Bi+l9EeflhyXF89wkDLaiWhCxHbPwziAX0Lw61qZukehfAMw==
X-Received: by 2002:a17:903:2311:b0:235:866:9fac with SMTP id d9443c01a7336-237d96b63bfmr280113405ad.2.1750775556394;
        Tue, 24 Jun 2025 07:32:36 -0700 (PDT)
Received: from DESKTOP-RD0GVCL.localdomain (124-218-195-161.cm.dynamic.apol.com.tw. [124.218.195.161])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d83d0bedsm108923595ad.67.2025.06.24.07.32.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 07:32:35 -0700 (PDT)
From: LiangCheng Wang <zaq14760@gmail.com>
To: andy@kernel.org
Cc: zaq14760@gmail.com,
	hansg@kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v4] staging: media: atomisp: fix coding style in ia_css_output.host.c
Date: Tue, 24 Jun 2025 22:32:21 +0800
Message-ID: <20250624143221.2371-1-zaq14760@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CAHp75Ve_G=ziR7sJmKw4t3BRASogGQ1kWUsNNNWESFmmS4rVhw@mail.gmail.com>
References: <CAHp75Ve_G=ziR7sJmKw4t3BRASogGQ1kWUsNNNWESFmmS4rVhw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Subject: Re: [PATCH v4] staging: media: atomisp: fix coding style in ia_css_output.host.c
In-Reply-To: <20250624-bar-v4-1-9f9f9ae9f868@gmail.com>

Dear Andy,

Thank you for your feedback.

I will review the entire AtomISP driver for similar style issues.
If I find more, I will send an updated v5 patch accordingly.

Best regards,  
LiangCheng Wang
