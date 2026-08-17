Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12A813B27CE
	for <linux-staging@lists.linux.dev>; Mon, 17 Aug 2026 21:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787003514; cv=none; b=ZFVbLlQAwJgJEvPzbpggQKeyv0/TWJnBRRgBq02tRsNr5hXk3slYh7Qe6kyEyBhU5DSlU1B+HIPgZAKLvWA34hHc1+jrOswfrzogQ1K0Jvy5SJXIzExFdTNHQl/u9dGrAI9vODsEtL23JHxWigNjC9TcI6Co0VYYQR0H/Yv6muo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787003514; c=relaxed/simple;
	bh=x4sjN/AKaWAGZmeBH2ZUcp2UwC2KUwkjlW+z2W2URIo=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=B25r6i/3qN8OmRMnsFk8PXVoH4UN1v994yygK8hilMk0GJ6La8zgIW2QnLxCSCqIUU8S71PzPJHtSpmmkAQCVPGkUwUnPN8itdLiVpZcfqS37YddJf0cs34IFrgR/6FggGYlmGFtZCBlDId90DNu3TNPCebc6NgZnwbIDP+TO4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Et9xNWaO; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Et9xNWaO"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so36548525e9.1
        for <linux-staging@lists.linux.dev>; Mon, 17 Aug 2026 14:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787003510; x=1787608310; darn=lists.linux.dev;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=x4sjN/AKaWAGZmeBH2ZUcp2UwC2KUwkjlW+z2W2URIo=;
        b=Et9xNWaOlxDHQLrAsZMCDzGck5vAr8MnE6U4oE6uy123hP0ZW/5cmJRaZ+NjdXabJ8
         vhWBYJ3/Gqf5JyC5i/rNtxGPx3tb+O8uzdz3pmzN7lEVahDMCvsH0m5/0SpBkl08WLZA
         eGxUFTQnpThg8wQ+hDYp+IJTqnT02YCGQeTnQ1GWCV0CSnyW9d9BfeZN3e87cLDC2qm+
         KpHtRzmK/mT8YNhxzUnMUYyw7zeAvpnnr2ao3H9SxSpuBAXLkeeLGVAjwyDSzKHTTpWD
         RDm0PagKGWKUiSpD0R5/vVFg7AKcuLN4KME0MW7KX7BUZCjLbJMmOe3kYNlBW7RstDu5
         w5Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787003510; x=1787608310;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x4sjN/AKaWAGZmeBH2ZUcp2UwC2KUwkjlW+z2W2URIo=;
        b=LvUtazXhveHRbv87I6pNaGuskuzx9UJM0z/iKgTJnpHJjeym98lQ4fdnwfuOL8n0/8
         MBS9QsbiUkXeYu7iela1clvqdDpes/kofw5ncqRxNbkWasKF5UjQTZGVAfg+a6sgof5E
         Mm2TeyEM5AsXpzM8fUZL+rnReU9ttg8fc0kMUANKKZGRiGff7hh7ywyrl2hSe9Cp/5qW
         78UfBZ9BhtoP3MjCnxhB0IKDhC9cSIMvkSmF/sz3w5wHTNeH/zEi+TIMF88fvPbllvYo
         y9LoEnDgaKjlSKQlZ+ZXhFtdc4n8X5NxbNfjF4F49dOtrr8WwTjxw6lkPbzzI3t7XdGh
         yXog==
X-Forwarded-Encrypted: i=1; AHgh+RoIV2u2nAZKU/uFVP/ZI+C3AaqqDsUfk63b3kXf88dUjcW9oW6CqfsKwG5/LydJO52kte8boWEyDJIR4U+U@lists.linux.dev
X-Gm-Message-State: AOJu0YyGM6rEknX/hz9kQKfDYHR4MHcSq4a/KpfTmqfnT02wiZt1gUdw
	pDVr6ZyXaV80KU6r89Pu1ELnKrfLkFpQFq6Rx/IAuhsvpLG0RuIZG2eZ
X-Gm-Gg: AR+sD13LDOxq0Q5Ctt61/Of7qE2bks1OlLgYbEdYk9MAQTXhfqwfFkK0Joh5IEDwT6C
	Q3VMjUtHObwkuy1a/7Huqg5Hj3YpGHoDJbxO2sRVguhGb5OA8JJaZ6cpoI2xcUro0vHqglmkEwj
	+7UC336wXXSoNW6r4wjB46moc4zLZcg4ZH6Gj8fmmWzfzYSENWCjwcN5QMTTnUc+McjNtPBQGvV
	sOLcDpNOjFLEGcLqkpEjVK+PExIopa7cLKuMLrXzp8BJeoxq81Uf24SO15X6DM4mDx1I0Uc6b+l
	aDwaLroTfy+297TcIDGUXadDObCGK1bnBsBDOxbajW0/R1NunQFdxsCWu7h2PDMftpI5XtBcb9I
	NzZ1s90E1puhAv/U62YcoTVvj4sl8w4SN8/99LOUQBWS+9T5AQqM0YEQhxCeI+X+LmbQwgXnZYC
	Fn1cKnE3IfdHaw7AUdqB95ZKM/qU6QOsQ5UHo/D94gkHWTmXcxvssWRPb/S8envtZxyIYgVwwk6
	vfF4YQyL/cE+fHv+f2cRdkNzKea37qEbGAefR56dRNAOCMFgHwLv9pV2xzAy52r9Q==
X-Received: by 2002:a05:600c:4e87:b0:499:80ce:827b with SMTP id 5b1f17b1804b1-4998793867bmr392242985e9.4.1787003509504;
        Mon, 17 Aug 2026 14:51:49 -0700 (PDT)
Received: from localhost (178.43.142.119.ipv4.supernova.orange.pl. [178.43.142.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49987b2a176sm309465955e9.4.2026.08.17.14.51.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 14:51:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 17 Aug 2026 23:39:55 +0200
Message-Id: <DKRJMF592GX4.2ZR8HRZLIXWP8@gmail.com>
From: "Artur Andrzejczak" <andrzejczak.artur@gmail.com>
To: "Dumitru Ceclan" <dumitru.ceclan@analog.com>, "Tomi Valkeinen"
 <tomi.valkeinen+renesas@ideasonboard.com>, "Mauro Carvalho Chehab"
 <mchehab@kernel.org>, "Sakari Ailus" <sakari.ailus@linux.intel.com>,
 "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>, "Julien Massot"
 <julien.massot@collabora.com>, "Rob Herring" <robh@kernel.org>,
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: <mitrutzceclan@gmail.com>, <linux-media@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-staging@lists.linux.dev>, <linux-gpio@vger.kernel.org>,
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 "Martin Hecht" <Martin.Hecht@avnet.eu>, "Andrian Suciu"
 <Adrian.Suciu@analog.com>, "Cosmin Tanislav" <demonsingur@gmail.com>, "Cory
 Keitz" <ckeitz@amazon.com>
Subject: Re: [PATCH v15 17/22] media: i2c: maxim-serdes: add MAX96724 driver
X-Mailer: aerc 0.21.0
References: <20260807-gmsl2-3_serdes-v15-0-7212e9e5156a@analog.com>
 <20260807-gmsl2-3_serdes-v15-17-7212e9e5156a@analog.com>
In-Reply-To: <20260807-gmsl2-3_serdes-v15-17-7212e9e5156a@analog.com>

On Fri Aug 7, 2026 at 3:02 PM CEST, Dumitru Ceclan wrote:
> [...]

max96724_select_links() sleeps 60 ms after RESET_ONESHOT and never
checks link lock status. Would it be possible to poll a lock bit
instead? The max96714 driver removed in patch 22 reads such a bit
(MAX96714_LINK_LOCK_BIT) in its log_status callback. Polling would also
let a dead link fail here with a straightforward message, instead of the
failure surfacing later as a timeout from max_ser_wait_for_multiple().

Kind Regards,
Artur Andrzejczak
