Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AFC5196C7C
	for <linux-staging@lists.linux.dev>; Mon,  9 Dec 2024 21:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733780166; cv=none; b=N4QFePmjI1EQAtlr378851jP2KysHV0x5vEDNFEf9MIu/TP4ib3ryvxupNknW2AGqwhLcWjllZ5DSWQsawDCg+56zEdPPrMwhkRuVjlnL66gUYYZfrOO+lyG3SUmeoiyk1KzcXEw1t+9Xpa7tiHCWkcxNSLytUMiGrvvQ6PDS0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733780166; c=relaxed/simple;
	bh=D0GwfPYzY3d075kroJefVRvpK4Ym45rskIgN5d2eWRY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J8IEpfzD1sIm2eGXge7pKzL8EW/qtlyg3sZvjVQEp78ccCyf2HyYdddeuPPQ8J/ujpcivcE6tf8gBp28qXRATcuCfbhvvWeVndNvZLwLh1J09ZlUUHGidjbQDtVhlo4rtwjTk+GDu/jO3tT1DDh5+/LE7SQmJeXaCCH8590DIv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z03d5d8M; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z03d5d8M"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-21619108a6bso23749995ad.3
        for <linux-staging@lists.linux.dev>; Mon, 09 Dec 2024 13:36:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733780164; x=1734384964; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7pMt4qFSFzCxvYGSp6kfDCRph+Y7dx/tSTao0y9+V/Q=;
        b=Z03d5d8M8vuFFTrmP2idn+V7MQmOuSVZnOeqR1WoRcna+njomLSvg3V7rzcEMTPSRE
         9AroFkbUZ7I3XTKcMoVIKPk5KalWKnWgYNBDatsIPXUusotuzkujuBdVwusGhyfNcd/r
         72RuGK50c5r28bURuQ0NZ/oBN2pNu/OPF2kpsUMq+mEHGNmzX/MVS/lTMbQExc6/drNG
         CTRhE8uKhAN/0bPyYS384QTytTvaMOueD2kETp7LhIQiQKPK5DGlL8ZlSwF1tkROvFm5
         3SsjJA+35VojrtSZR3S4q3t3j8YGqXkxfV5oVKWd4/gsa9gYmsIZvERGskMjFhVujgXc
         cfog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733780164; x=1734384964;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7pMt4qFSFzCxvYGSp6kfDCRph+Y7dx/tSTao0y9+V/Q=;
        b=G8eOiL7F3oPjqgmW+b/a8herWxQx2oQX91WPg+aZ2r10I60YFNQm8Vxyt5N15pcQOu
         EKkoVdmUWPJNdTVl6E/ic/1gztH8x2zqYkygWE/6SbXDQMinV3kjQXxP67bPDpU/MOqV
         mBqJyM2DGasmTxwzQwqdg/n5UvSGvQTe4Qmo9d1XYpRljOiT4Abkh8cCa20JTwiARv3j
         O2cU8dYEmIR03Z/hEtFl8qbBtXn7i2GMEiPLXN4DSpcKoLovYjqBk8RnUHGHSRMqgvMN
         SZ8D6z6YhAP3BPiDfZFSjH/qI2Kdy2Z/8aJbcHfY4eH6oZ5XNTWNvtxClWADOKXuyVCb
         r8Lw==
X-Forwarded-Encrypted: i=1; AJvYcCVSENGKQKoTR5WRUZBW1SssntyOYmWQj6Q8OsU9alq1dkpy5nQH8mSXQuIq+kPBpxhDQ2RDjGFRpaYoOFA8@lists.linux.dev
X-Gm-Message-State: AOJu0YxS3XwDkoyEshtMw87WlttfTRz984LN4IMnJa9xe4GTvPe2MfMk
	Hp1x2EWCt2bMDpcSWmDsNWGE+YA6rBH2kvgNXTRRXl3ZpKzCEKp2
X-Gm-Gg: ASbGncuHBgEXAemeRTLDbB2KevAxmpvNZr5eC/fy/Ep29hbTIK1unx2d2E1iwHe1NZu
	WGhc6yeUyfsdnwMjiJMMSbNUXgBdts1gn0Ek3iODXxqa9JqI8dXkHN57XCfaeBsM4wb0OyArRqz
	Xs0+gkCZT00H3QgZFfsyMrKbIyHOm1ZtZ41V8VSRsE2fqauMQ6kGfTVveiQMg424uVSdFVqJoc/
	bCXgzfghLEgH7bMupjyB1/rGMnUuJZh7bbDKw2K5tq3WmKA1AhmcAZlFdDypNTMVjA8Au0cQwqs
	wg==
X-Google-Smtp-Source: AGHT+IGsrljXaZKtJMEfPwNsl5nnfyFklzAzvDNzZO2kCxojOA6DcgslKTWJXpL0hci5T4lQb5O0jQ==
X-Received: by 2002:a17:903:1ca:b0:215:6489:cfb8 with SMTP id d9443c01a7336-21669fd0edamr33805595ad.10.1733780164144;
        Mon, 09 Dec 2024 13:36:04 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:4c64:81ec:7409:107a:a63b:a3da])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-216634dd69esm14523955ad.40.2024.12.09.13.36.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 13:36:03 -0800 (PST)
From: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
To: dan.carpenter@linaro.org
Cc: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	philipp.g.hortmann@gmail.com,
	rodrigo.gobbi.7@gmail.com,
	~lkcamp/patches@lists.sr.ht
Subject: Re: [PATCH v3] staging: rtl8723bs: remove code depending on cflag
Date: Mon,  9 Dec 2024 18:33:36 -0300
Message-ID: <20241209213528.5917-1-rodrigo.gobbi.7@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <42d24db0-b403-4c4b-8607-38f3cd55cf63@stanley.mountain>
References: <42d24db0-b403-4c4b-8607-38f3cd55cf63@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> The commit message should answer any kind of reasonable questions
> a review is probably going to ask but it doesn't give any information on
> this.

I'll try to improve this for future patches, tks for pointing that out.

> This commit would easier to review if it were broken up in a different
> way.

Ok, in that way, a patch series is the best approach here, right? 
Despite the changes in the series being dependent on each other in this case.
Tks and regards.
