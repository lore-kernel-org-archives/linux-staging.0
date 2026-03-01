Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D705E2DC79F
	for <linux-staging@lists.linux.dev>; Sun,  1 Mar 2026 21:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772401216; cv=none; b=hZgk93u28vOIU/ERZ12EYnL6OuGNEjstAOqb7C0tBCxPtC2jgIPktP4InsVJpfrfBQl5SPTQisKtaC4E0fJmTTZB/k/DQ2H7YheHjtpjDiA67dNg5QcswBnHQAyzez9Szt7tkrsxtcBEcSYQpK1YRr2jFvFNqKtI+kprpCDRx5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772401216; c=relaxed/simple;
	bh=Gf+LehvLqWwUWMmp08MsSGGSI5hV9/Ixf7T8p+f6+MI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=gft5BMl2kVUOHE3w+P2lYR/tiKPuxNKY3TO1kT/M5HdWypIYCx7+S2G9QW/NQircp5c3YMyuQJKAuB9CvasSMBHcary9yEfu7ZPxWt5/R3njAqSd7y4NlkQbrti8kcGGVJdv/JQpuKYhQlqN41sqzgSrezrisGuB0MfzEi2lBzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZE/0/Y2j; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZE/0/Y2j"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-79628fb5c05so27886837b3.2
        for <linux-staging@lists.linux.dev>; Sun, 01 Mar 2026 13:40:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772401215; x=1773006015; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gf+LehvLqWwUWMmp08MsSGGSI5hV9/Ixf7T8p+f6+MI=;
        b=ZE/0/Y2jcvMq6Qkzx7iIFsm+mI+Zj+NiN9WHSp1gKCk/sd4eoLTqkk2xVN2o6Vct21
         nue0NN+GQ8V3tC0Hn4zRkDBHlCf9alMzNsMaYOWHA0kzLT5RKMtVQ428+smXP0/3+XTh
         OHTJTSDLNkAruCDUNvoUXP3uIUY/yd11sQuWVE9IHmRglLnflg/KNm+KncJrmMAukvnU
         BcxCKlPgDfkDpNRXqqScSn8aK71k0J/Q5VI3dzzyjQ3r4iaIjcvenbkyRE5B6+MNY/G7
         8d36l+w+hhZD4/iOi+82uOYzalu7egSQ0xTJz92P1gwpFhDyBdbkbTsY++Hsn/P76ucx
         JBIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772401215; x=1773006015;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Gf+LehvLqWwUWMmp08MsSGGSI5hV9/Ixf7T8p+f6+MI=;
        b=EYz4kdtawPZ5i7mpz3Qz+UrVhISzoisg/c66dTTsm/Vo3QUlwQwyViEpu60J/nPHyh
         X4xVdHplkT3ABwCpTw3XkaBDZliUKNPq3wf98CO5s7EIbyS1kX2EzEAEmMvJEyH4WbIS
         979YDf5CWpQTd5vtZQFKP49txEb5i+JeT/YbBaZ2TlGHUAhe/bI/GE9psDsCZWKSkBJ4
         FeleLS0Z5iXAWstNJUTdlrBAYDaRMkzhvV8oKFseU9js9cYI4bRPf1w7QCnGEiYrPoYu
         aZw0VRqMLjmMYUtZm4oiS4mX/nb55hNjpiXXE0rHYJ6WA4qJA7OKNPqaOxHRmfdUnZL6
         8Ojw==
X-Gm-Message-State: AOJu0Ywc+Ddh5Sofq0KzGG6xpOd3fmp1g8FUhDTtfxw8GqPewObUZ7fI
	T+RdIjs+CzL8sVA0CBye+BTMC5BOoH0oyqmdPCqMIiSoOiprJwkah4ya
X-Gm-Gg: ATEYQzzVzqSVoZ6gS84N3iatNE0b0rcNdPnsuz3pTvCR3c7drXv51q2eb9kibvZ6F0M
	pU7WNuoKvD3H8tlGGlZ/4y1Lg6KlP+jaelW6OauCxZZlt5by0r9C3Ggz8G5bHdPCg6kDyIqj5wO
	Ylhyhrq819GjOXJuZJHhgXyEkCNiD9CpS2FlIeqGSDHrod57oeUWrs6YhnNdfYf2ENx+jZfocMh
	mJ/v1xTkBmpS4xId7TJI2OdUf5DosUR5qtSuyXoc/Rey1eizQLvU0RI1PP0YgObMRKeeuIGjh3P
	6h6dfIjEN2FbP0JRPTB/xv/4wSTRMYy/zugnhKABYkEq4/RlPq6Xcr7VjTMR0/yRwgY1DpZt7K8
	aP5uiyFPLNiNaxETEz/pYX7n+czMeQsF+vkiNlUEk4CJyHWiwxIUEUB7diyy/nlOt6hI+WoLMLI
	6eZhf6W1bdTBavlWh5ZOQAhaRJLiMDxKiPOFomQQmP/+QTAcDlHG1oXcUDY1tfBZDdyzr4Gmnbg
	IemF/UCX48Nfp3zvhABLISOXjggtnDhdTmZFw1+e90=
X-Received: by 2002:a05:690c:ed5:b0:798:6af6:a413 with SMTP id 00721157ae682-798854695afmr95981047b3.12.1772401214866;
        Sun, 01 Mar 2026 13:40:14 -0800 (PST)
Received: from localhost ([2601:7c0:c37c:4c00::5c0b])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79876ca7354sm43205827b3.52.2026.03.01.13.40.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Mar 2026 13:40:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 01 Mar 2026 15:39:56 -0600
Message-Id: <DGRRSD969EY5.5S1OWWU2902T@gmail.com>
Cc: <linux-staging@lists.linux.dev>, <linux-media@vger.kernel.org>
Subject: Re: [PATCH] staging: atomisp: remove useless return statement in
 atomisp_cmd.c
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Oskar Ray-Frayssinet" <rayfraytech@gmail.com>, <hansg@kernel.org>,
 <gregkh@linuxfoundation.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260301212900.3783-1-rayfraytech@gmail.com>
In-Reply-To: <20260301212900.3783-1-rayfraytech@gmail.com>

On Sun Mar 1, 2026 at 3:29 PM CST, Oskar Ray-Frayssinet wrote:
> Remove unnecessary return statement at the end of void function.
>
> Signed-off-by: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
> ---

LGTM.

Reviewed-by: Ethan Tidmore <ethantidmore06@gmail.com>

Thanks,

ET
