Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C192D1931
	for <linux-staging@lists.linux.dev>; Thu,  9 Apr 2026 13:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775740585; cv=none; b=XbmLd88gay0Gq7zq5efRmAU8RQlJm92qGX9ZYp5BC1ib/yyxouAlQvfxTmW/6MLPsogkUxQo0MWAkQBiMc31nGTE84YYzxwh6VKsA0ytPBS5mJPMJItdzoLU364KAb3tNaueW9iSt7qsyc3XQL1QffL8N3JXQafeiaSfXF71vuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775740585; c=relaxed/simple;
	bh=h+QbsKbee+teckL6tlqLAOJIGPwVy7DKG1NF1nl5oqI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PxKm6qXyilNcRK/gHcCLXWTtBOgZVhgU//i3ogBQEZlQz4EfHJ+h6HivGp7zQJ3gX+MTFR9i56qP1vrDy8zfAEhSYEt40efGlGCjryUDk+Pyly7DbDPcWyPnXcRH3/qabpjDO1Ey3hzzVUK3uqjKttNPjdwIQmY2su4rBuK6t8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rLPdTIsA; arc=none smtp.client-ip=209.85.128.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rLPdTIsA"
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-4887ca8e529so5950415e9.0
        for <linux-staging@lists.linux.dev>; Thu, 09 Apr 2026 06:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775740580; x=1776345380; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0kiQfyJYXCmxkLscFErhbfG5HZod4Cd4A1Z3eGRT0gM=;
        b=rLPdTIsA6vhlVg7Qiry0yOFSThO8wZ77bmlxb70Bpuxl5wtHtY4CvTNhrOmN+njHvG
         J9eZkhQhd0KSglCTuyru32719RLiDN/0W8khP5lWyveZ5sYcRsMW2dsZHmicZ2uGDLC2
         MZM0DoEyeFgjGlVFD/2ESEcNQugXJpp4DmqiWXq/yiIEl2ptWNPD9vh86Rii5O3DXoSV
         knQFeN8SzHWltfZcmOWZgwfHPQGVFX0i7X6Hb7gGJiCNMCTO7t694WphzCJITMMgW9t2
         DTtg9jsTZvo6NtlUFZMmnK/SWZXMREEoUbcJgukhCOqj9ACEnePCCFyKwfg5vsrdbt+T
         FCig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775740580; x=1776345380;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0kiQfyJYXCmxkLscFErhbfG5HZod4Cd4A1Z3eGRT0gM=;
        b=TC+CGD7FvrxNAOpq6sz7euqAJ0XqsrXQ9MnQyBXL2WX4w6jM1S9JPnt7bgFbKbyG6R
         2VeTYFPgvGNevLKcatioYG9NHdc8wSNnElruL4/dW1pDtBKR7VzvbzK3EM4HAkW4O74z
         1COi2YfkwXFb+eecvOtMCKphwYxJ57rU6sKl3fkscHNxZhRPz6dbYC1tIGc2AosrFyxY
         90PIT0j9Unp4T2cUrulCZwukDO9YZDG191tMrpe5av1BM+yUnDmzGf4+KDiNuVyNw7Cv
         LPiNhduGrMRdy/Bg95ty0elQPBYdIL5GQcaRLR7Q/TijxqPeQ+SMTsDDL9sIcNZ/eWz9
         cjHg==
X-Forwarded-Encrypted: i=1; AJvYcCUtB0RFTONLfidNQ/MpEiZyiE3KrhbRnhEYle/5NQzHThcpi+6VM9Zxxn4PQPrZFAyy/aYIyJBLTP0i6LnS@lists.linux.dev
X-Gm-Message-State: AOJu0YwZ2Jh5C8/MA08bOEI9ykVsAWgEDYNhfXwf0NZII9UB8autoHrf
	iTt9Yf/namuBGUij8cfEOH1aGIBdEc9jc9EUxFlaVzabpvMN2s1SVBxJ
X-Gm-Gg: AeBDiet5SH0gq0PzxkeSosOJK7DXMnAaCM1I/nnzjenzWJOkbdpmkP8O8QjclQmKLAl
	SzaNwQYSA56JlZOAzL7UUOoNlyo+M4cL9sYgOJSONFiKmJ6TBwLCBRawbmJ8DEQ04/we4ir4K4d
	VbY1jWGZcniXTjqWbeXNrq6FDtJ1+An569/1DJ/9ies4vK6+jBPolA03Jma5lXnd0ao5rZ7mmXZ
	uS7V5biStQreY7XPR7h9by3RwFZJy99MwHcJNc8wdZ9IqFrfxBCF7bJFpqpXpXVwBYq2B/tMyce
	Qh+mmU49SjvKi3YvPVo/EHqcyE+/x1jHbb1N7xTeTVtB+b39I4yHxfzkKR34ZvvC1wzCY6Idxzg
	9iTTVW+sgoZCTwPi0Lz+je92KdNa+1cway26OCNmP8ha4El1z3vmZzKdRNiv4vxM6jNRSG/NYXA
	V01EyR3nxX5GyI4/nTm9GPtGVrn++gK/V4XuivXxmr
X-Received: by 2002:a05:600c:354f:b0:488:c239:d498 with SMTP id 5b1f17b1804b1-488cd557418mr46616005e9.8.1775740579457;
        Thu, 09 Apr 2026 06:16:19 -0700 (PDT)
Received: from DESKTOP-BTQF5RC.localdomain ([85.110.79.247])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488cfa5f10asm55955315e9.10.2026.04.09.06.16.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 06:16:19 -0700 (PDT)
From: =?UTF-8?q?Bera=20Y=C3=BCzl=C3=BC?= <b9788213@gmail.com>
To: contact.pranavdesai@gmail.com
Cc: b9788213@gmail.com,
	bera@yuzu.li,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	straube.linux@gmail.com
Subject: Re: [PATCH 1/2] staging: rtl8723bs: remove commented-out dead code in HalPhyRf_8723B.c 
Date: Thu,  9 Apr 2026 16:14:52 +0300
Message-ID: <20260409131451.1221-2-b9788213@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260409034859.42356-1-contact.pranavdesai@gmail.com>
References: <20260409034859.42356-1-contact.pranavdesai@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 9 Apr 2026 09:18:58 +0530, Pranav Desai wrote:
> Remove commented-out code blocks
> 
> Signed-off-by: Pranav Desai <contact.pranavdesai@gmail.com>
> ---

Put a period at the end of the sentence. Patch series needs a cover
letter. Also my mail is not bera@yuzu.li.

Thanks,
Bera
