Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A883F1E7C02
	for <linux-staging@lists.linux.dev>; Sat, 10 May 2025 17:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746899015; cv=none; b=m6zy1yJ6GSzihfNIXJ8WCdB4Atzuf11VJIJjVPPUU9dAliPnvf4KMG1ZC8WPZla7TP6c61p0LoQKV8QhrkADgEZM3l7zTeYVKmkzabzQZo4husxCWkk4OTGaqNVlG1zjpPkVGnfQzBF9DjPc+DzLT/nTgZzAdQy7vkhB7WQk4Do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746899015; c=relaxed/simple;
	bh=jMyHj2bRFRLFLwnL0P0MWOlET2HCHY3sbBxhS0iCR5Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=m2AF+ZkHG8LV8ScFixLXjRYoH28tLej0PeaIAmjPVzUi9TOP62z07Dlq1AaWFKiZyLL1Kea4AStnsQM2iJDGd/3gvjGumlZ+2mFboZvMEpNE2T12PuCbaA0nIipgQQWxCEekKZBGZAHjGraaPhjndOlEB8UbXgjp/yTI3JQ11c4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TBa3jyea; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TBa3jyea"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ad241baf856so65052066b.0
        for <linux-staging@lists.linux.dev>; Sat, 10 May 2025 10:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746899012; x=1747503812; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XudQIlWXwf0Ka7UaZjcMta2G0Y3PX5txiCv6+/rb6yY=;
        b=TBa3jyeaPptwKlVut6FRxoYEpoQAKpGZjccxCp57d61DQUvu1na5gFdQ8QdlxuUGJG
         fa0x5FZIKEwl9/4respn2KhmTOvqYW7i4H/ZmSJwmpyezDiFfbVZCFxwrJEVaozYt/ys
         TuzW9EVZ5tsWIX5FqfaRep5AmYEt8fYn+9EK0fQDJd9k389fuVVVcBimRbhPS1Is8N6q
         yEb8CFtiWbqq2maqgaW4YyafofwsLtHWMLP7L8tMIL4fsrfo5gsaQaYB+9ZXc+6VLQdZ
         SbzUrV+RUqyogFECx5KNFwKnycwLG+pugNUcwkkEgs5OjKIXiH8Zv6ycILbCvpArDdW0
         HkXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746899012; x=1747503812;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XudQIlWXwf0Ka7UaZjcMta2G0Y3PX5txiCv6+/rb6yY=;
        b=GRvyY7tAoKpOI+oTgouEaol1H3sxAPQVL6iu3zbMkSVrbJIrhOd9QyGA+NZFXnBMLg
         No6Weq0M/TORjZzisz2gYxLt7Ht02TXixi0Vy0Qvat21xUXjIqGGkpcRFyAsKenJTQdh
         SULWo5d02cSsKUuJLqWdMw98WdOF+4zxS25b0lCGcySOciUgwMt0jEzSOF3w80DuW7sg
         zOpDZvd7rpvwR2res/LKDwTBx8bOofX4eJyA0YPAW3uo2IcdtftBprwu9vH6AVHTt8O/
         SurARmzwnqABKqP3dSzFz6Z/I0vT0j89d9HnCgj4UxFniS+ssIwZFA4vtAPGN40HAFLj
         vOyA==
X-Forwarded-Encrypted: i=1; AJvYcCW6yu7gje4hzZ1GFibDWPz9IbmhS7HcCFJG4wfypkCO75tX08kIdunabxPYP5APx613bAG21xsvDu3FuOfV@lists.linux.dev
X-Gm-Message-State: AOJu0YyZqaB3JvbRyiKyZ+NgOa+Df8LUXD7GhJz4CTTba282feccdMyc
	E2uH5u9JukKCqIC1t587PcuX/TnLIVkFQWzPOBITQdCmCdKyxJAl4FVnMX5P3HTg8Q==
X-Gm-Gg: ASbGncsfw+2xiSd5SL3JCn0F0QbBtlVvxMs5itoAFHvIndJngywdLkof++NyPzRhVYv
	Sy+qXxGSfneXjeWUF8Ofe0ApM8NFbMYsUrnYeyyrgxvPcbFT3Adt3g7wA+AVMi+4JWjg3TSdM+k
	o4Ki5EK12BS7/Cf8HoDZR+jfvgOc4Dlu7rOQuLUeECrdfR/MFh4nkOH91sE3SlpUDibrquxdhLf
	Oceftf6YcfQwVaMUqmXOUN/1h7WvHpuaj6rEr7jJdIWpeHLypSwtTPEp2aIjAjvV8ifB9FMyp3k
	LUEW6/02cJtWb4ti64HX7sLw/5JGirQ8yl2+cdyCKYE8ogEiXwldAbksoOfMCpsGNZ7QjlHFtZg
	43vpp+uMDVt3nCd4fQBZhBiXIg4ejfiyJWB8xMbzECgTdWt36hEqxsYrMc+ZNHdOjLfZXsWxmqP
	asXe2bTcsQf69QCX8usBLqAQ==
X-Google-Smtp-Source: AGHT+IFxcxlx2x8TBUFtxBWf7qjrNckgV709Zpt3md2UpCKd4rKDt0E0SjpeXSciSxXU3cEGDq4j6Q==
X-Received: by 2002:a17:907:1c84:b0:acb:b9ab:6d75 with SMTP id a640c23a62f3a-ad21b4272fdmr702172166b.23.1746899011668;
        Sat, 10 May 2025 10:43:31 -0700 (PDT)
Received: from chimera.arnhem.chello.nl (2001-1c08-0706-8b00-79cf-0e0d-6e5d-219d.cable.dynamic.v6.ziggo.nl. [2001:1c08:706:8b00:79cf:e0d:6e5d:219d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad2192c8608sm343613666b.26.2025.05.10.10.43.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 May 2025 10:43:31 -0700 (PDT)
From: Thomas Andreatta <thomasandreatta2000@gmail.com>
X-Google-Original-From: Thomas Andreatta <thomas.andreatta2000@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dpenkler@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 2/2] Staging: common: gpib_os: simplify return value handling
Date: Sat, 10 May 2025 19:43:30 +0200
Message-Id: <20250510174330.297207-1-thomas.andreatta2000@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <2025051046-ipad-overdrawn-8890@gregkh>
References: <2025051046-ipad-overdrawn-8890@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> But again, as this can not fail, why is this needed?

Agree, should've checked it before trying to solve the "FIXME".

> Start way back at the "ends" of the call chain.  If they can fail, then
start propagating the error up all the way to here.

Sounds logic, will add it to my check-list from now on, thanks!

Best,
Thomas
