Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FB201C680
	for <linux-staging@lists.linux.dev>; Sat, 16 Mar 2024 17:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710610980; cv=none; b=uDwCErSjr04BLWTPkFBOo/ZDorJIea9h4zPLe8WGYxj/uTinpynOKg8YqHcBsmelZ+o5nliyubKqkrff/zuO0eY45Wx9itu7dJxg2MYGMg/SLeGmumho4FrWnF0wjDOoJwuCGsFITE+X6Zrzi5d5E3fNScMI/AILf4Hq8hIqfoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710610980; c=relaxed/simple;
	bh=0NlB02xnwKs088BmcRLiw+Bka8WAAIcaR1kXa4iCEiQ=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=D0y7IThkGYw1rzU+tqsUdeD185EWG6WzOr3mXavh1k+fBzI+mOhPg6G/hKID04ut7jkf2CLk4lIqDxDlPL23crcavkYDYWzOey3juAQd1np4KO31cIwoAjNKQdJv5AOGUqq/MT5mYJ+yiwL//9/rtS4oYagkWZJr9ra1USlGOp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mSOvfx5g; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mSOvfx5g"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5684073ab38so5929078a12.0
        for <linux-staging@lists.linux.dev>; Sat, 16 Mar 2024 10:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710610977; x=1711215777; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0NlB02xnwKs088BmcRLiw+Bka8WAAIcaR1kXa4iCEiQ=;
        b=mSOvfx5gGmiMvMYulE8DJvHDTFaKSIvoLirk+Ue1P5fF0oNZUpZkQsqAPMjVkqAMT+
         CVTjIkVQqCzv36R3Y90r64e4NLcL9vzccD108yjRuYAP9d6tXtwOGwHv+2wy9WlhFI4m
         Hj7a+nWoUQhv0yukBJ5VgQutSfqeygGT5Tuz++A5VHDwqrGNQGXb+3z9trn5wd4JtQUz
         PLQqgqTV2H7pzyN67jum18onwzGMyYjm42lA4v3ZsqlbWTa8Dpg3gu61ogoOJdbL+O2k
         JrkhEGas4rhJWOXIa+9aGgIJmLCQpCyGXxDRWswz3pZGwHwCqC0bPNU4Ahs13pgzMeG5
         ZXFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710610977; x=1711215777;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0NlB02xnwKs088BmcRLiw+Bka8WAAIcaR1kXa4iCEiQ=;
        b=TzdKHmMDumgFmLhRvZeiZwzgxoy8K6l6vNLB6O6s9SVI74hrUNjJTbJAg/oZoV+Ywq
         InWBvu8Za3o/DAWEbJ8X4gWSkeVE+xQKcQ9bHwp2YJh8GZ/yEn3kEbuqH8cqgbgNZF7N
         obIedwEfx47KxGnnvtk0+ioy2mOkwDBoNtx3YOfKoNPL6/3CcQqElNqwhantvyZ1WDQ/
         HmDs5RtOBRSqlvLopf/8SSmjneLkWFIF+Ki6Gp708NarpcFF7wDh4ZdjR006F44UZiyK
         YcCy4L5A4E8EtgGBI/dZ7qymJgZoYNcNF1nmsr7VSEcfDy1GkEbppbWLGC7eknvVcOf4
         4Vog==
X-Gm-Message-State: AOJu0YwcSprYng/ZNdPjE9uWplPEyRUCRwYKN+3nsu92t74zo3HcTbW6
	/upIFzhEYG5+O+iE5437ykVkU9ezMVpjMdClfnqebHIAwb4qWAx1Iae/bUgkNTQ=
X-Google-Smtp-Source: AGHT+IH4QqTmofGDQ7FCYqjYSwH6Z3VEjw7lK5Lq6tfe+hVY3nKFw9IrDpkZZn18RsMY9BeLTAqJMA==
X-Received: by 2002:a50:9b1e:0:b0:566:7769:11c with SMTP id o30-20020a509b1e000000b005667769011cmr12230447edi.19.1710610976934;
        Sat, 16 Mar 2024 10:42:56 -0700 (PDT)
Received: from ubuntu-focal.zuku.co.ke ([197.237.50.252])
        by smtp.gmail.com with ESMTPSA id v21-20020aa7cd55000000b005689f9158ddsm2734747edw.23.2024.03.16.10.42.55
        for <linux-staging@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Mar 2024 10:42:56 -0700 (PDT)
From: Dorine Tipo <dorine.a.tipo@gmail.com>
To: linux-staging@lists.linux.dev
Subject: [PATCH] staging: vt6655: Remove unused function
Date: Sat, 16 Mar 2024 17:42:38 +0000
Message-Id: <20240316174238.3803-1-dorine.a.tipo@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240316172518.2717-1-dorine.a.tipo@gmail.com>
References: <20240316172518.2717-1-dorine.a.tipo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Apologies, I sent the wrong patch for V5. I have sent that pach with closing parenthesis on V6

regards,
Dorine
