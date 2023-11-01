Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0205315B9
	for <linux-staging@lists.linux.dev>; Wed,  1 Nov 2023 11:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D9njrRvm"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-9d242846194so544915166b.1
        for <linux-staging@lists.linux.dev>; Wed, 01 Nov 2023 04:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698839343; x=1699444143; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xCyg1gCGVdfkuxm0mzbaCOgP6fP9l7HjSGJkW4c6pNg=;
        b=D9njrRvmgSlmy9b7yIcQ9/PDOcGc9dYGyVxWi41uisCc4Aw2yTfJ+M5LjGo/zCsbyF
         80XgDj8edgB+lwHrYBdy+lavrA8stoTua3p5ZYdBnc1dlnt+clPY0iUEbJzFEpzOZcyA
         oZhplVyhrmglvYQNA7B6Tv8/itD9H7hxamlz8bi/T/5vUCBrO3vZi+UbP7lhUVo5bq2a
         mlbig/EI1XsYoSjIiui1lRLnGQABWepmaVJVY97DMHy05lKCwQH7KTGar5Vo7OLDO6JR
         J85NIUWpo7KRIQMtJBXvcIlvTs22AGCYIFii/bVPwZS86S80gV/5SGy005l79g3uRLPO
         75GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698839343; x=1699444143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xCyg1gCGVdfkuxm0mzbaCOgP6fP9l7HjSGJkW4c6pNg=;
        b=atlj7G4Aj1a3Onl0J09+sTMFd3+c6HmbK2rr6SAFU/uARx7431w+StMdH5vbNhcFQM
         0gGNPe8GdWMXlk1cmHU3PIaRnFi8Fqe7oxVqH1WbwqBuk+9uBY01HhdJ6iCP5NKi+86X
         1HWZ1b+GIS033wTKYyFLIjerIP5IQGPxNf6QcCLs6SmeAOKh0ntyBBAIIv9OTJvTgqFm
         8kEYFjC88DEvAh7Ykg8o8Jci7e0Eh/X2UrN4jr9u9w9Y7w/h+j8oRD/58ZUMQoCza+OU
         mmJnTjP2elyAM/p3VtJfqfABNK4UyfsJmp1D0VHJdwclI4OO3yCjoRLR6c5ndNEJZF0c
         goXg==
X-Gm-Message-State: AOJu0YxAObLQoL6AogxkS5WtwiOc4a81Ini30GFI4DXCv8yHnzlqJahH
	3GavfYu7MtBqFq6YanTYcbHmd3Aa0h4OLA==
X-Google-Smtp-Source: AGHT+IHJMdfOwDj4qjqy6ef3jgBPCP9zZIPzeIYCZg4nGhQjnX9FUX3vtcsWvZrC9WV1dkukr3xVXg==
X-Received: by 2002:a17:907:3e91:b0:9a2:185b:5375 with SMTP id hs17-20020a1709073e9100b009a2185b5375mr1534026ejc.18.1698839342385;
        Wed, 01 Nov 2023 04:49:02 -0700 (PDT)
Received: from ubuntu-focal.zuku.co.ke ([197.237.50.252])
        by smtp.gmail.com with ESMTPSA id g17-20020a170906395100b009c657110cf2sm2333889eje.99.2023.11.01.04.49.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Nov 2023 04:49:02 -0700 (PDT)
From: Dorine Tipo <dorine.a.tipo@gmail.com>
To: linux-staging@lists.linux.dev,
	martyn@welchs.me.uk,
	lukas.bulwahn@gmail.com,
	manohar.vanga@gmail.com
Subject: [PATCH] staging: vme: enhance the help paragraphs for clarity
Date: Wed,  1 Nov 2023 11:48:38 +0000
Message-Id: <20231101114838.1557-1-dorine.a.tipo@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <ZUIAyQGSfIKqK7AE@debian.me>
References: <ZUIAyQGSfIKqK7AE@debian.me>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

>
Please do not, that's the responsibility of the outreachy applicant to
do, as it is documented very well what needs to happen here.
>

Hello, 

I have CC'd all the driver contributors for this driver.
