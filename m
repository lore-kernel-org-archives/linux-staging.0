Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE679153517
	for <linux-staging@lists.linux.dev>; Tue,  9 Apr 2024 16:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712680758; cv=none; b=DesWjaK8/X0fmHAiivllcr9/aik5xYPMZp3oIRbqLrI8C5Yo5q42MY3tcP2DH1cleUfHjMIRO3B+8SRvwK757fovCTsOcfN2/YzIE6ByjpEoh3O/LidKrayu8/+n2KAtjtuPxTLuDyOh7vmfLtCaUgnnv0s3rtKYu2nOeR1xEz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712680758; c=relaxed/simple;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	h=From:Content-Type:Mime-Version:Subject:Message-Id:Date:Cc:To; b=hV44phx8svtVt5ouAudKwfvQ24atYBCOjvKhDZ6cbCWvEtxkRXyCAKjhs8FAdq5sJN6B6yRcvfXjhdXjAvPYQi9bdSkgq9e/nQ7ADiXB6Boj19KRGjBxtoxI3yGqIGrSGEaBox720R9y4aA94yYWxNLNLZa+9kQy9zvNAIR72uU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eDkx8c28; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eDkx8c28"
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-6ea0f0ba3a5so1102072a34.3
        for <linux-staging@lists.linux.dev>; Tue, 09 Apr 2024 09:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712680756; x=1713285556; darn=lists.linux.dev;
        h=to:cc:date:message-id:subject:mime-version
         :content-transfer-encoding:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=eDkx8c28Yfwj/Ej1E34eFOsjZvn+96a4lP/brJFzvfyMJ9HPD+NKKNUN3eN+isb7Be
         j1xdpJOJ0GTXwO/G7g3ll5O46fr3R9/H1FqVbfElj4hK/tZ7zTJC20BIZ5eoX94CKDdh
         Y8wBh3ZIkqq0LECANCPTTboJVOeAFdRT1lLkEdS3IrAgQ7mpY11/GBLk92pXP0bbekW2
         jIcehyY3NKU0mNdfDO9EJFNvOiH7zePh+kCDpUocv4w9gsaTkNMoDMTFnjTSMKWxZV0g
         A3uR6ctksQS/6kSzsCBdvqWh4Bl7H+ssXBAI5dJhQ6pWeR1RLij3BRmMfZz21TfP5Lph
         01gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712680756; x=1713285556;
        h=to:cc:date:message-id:subject:mime-version
         :content-transfer-encoding:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=DmYRy7ehkUTsnhjPaNTtbuCeeCN/fKthGxnqWmwL6gHw/HTpi/DONpDgTnpB4pQvg7
         2z+Tu70BN32BzDSJDLPfg1nT+em6XzfXMcgbguo5hc4yUKjaEVASsw+F2Yv9xtwEXi0v
         Cm8K6bNdYNEWpYN949AlMak0EOeT0wVjMjtO6bQceOq5tBOVfk6Z4m/WF0H2ni6JUeal
         Q4IcbwtRlVwo7fiSZZvuoqMFbCjkns5Ew8pYhPmdkbO4HxcSF8WL5pzBBR9qUqcyJ+fn
         M7f4RKiAG4oQ4p6kw1vivfYhn9uezf/kdDMruBMP+2VXarbVEEQTG1zdcmFcfzr5QK08
         4m5w==
X-Forwarded-Encrypted: i=1; AJvYcCW7ZCUUlNbm556YOqi389nmlOIzMUflLHTMYnda5tMutNGc0gY8X7QuulaXkAe4yLBdKIkcXtOivSyVcByZVAv+qJ68K8xUIcpzCmSm8w==
X-Gm-Message-State: AOJu0YxwRoeR/fXhWx416U4lki/BxiquH+SMgfWhzMMUzpGODHlyIZCy
	bhcxsV6Xq7UkHw1kodZeTf0LQ1imWEs61flaBWpNMNV+CZVpENL6
X-Google-Smtp-Source: AGHT+IGJ5lNrHVrSwjpXPTtHBITp8Ar+HPnfk7p7X7Bx+D51y+T47ROSf82PBpkVELv/QS3b8b7J4w==
X-Received: by 2002:a9d:734c:0:b0:6ea:1e87:4389 with SMTP id l12-20020a9d734c000000b006ea1e874389mr363607otk.8.1712680755955;
        Tue, 09 Apr 2024 09:39:15 -0700 (PDT)
Received: from smtpclient.apple ([172.93.220.120])
        by smtp.gmail.com with ESMTPSA id g4-20020a633744000000b005f05b06229dsm8481034pgn.41.2024.04.09.09.39.13
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 09 Apr 2024 09:39:15 -0700 (PDT)
From: purofle <purofle@gmail.com>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.500.171.1.1\))
Subject: Re: [PATCH] staging: fbtft: fb_st7789v: support setting offset
Message-Id: <6012A476-14B0-4910-8DDB-98BE0BFC9074@gmail.com>
Date: Wed, 10 Apr 2024 00:39:10 +0800
Cc: dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev,
 purofle@gmail.com
To: gregkh@linuxfoundation.org
X-Mailer: Apple Mail (2.3774.500.171.1.1)

