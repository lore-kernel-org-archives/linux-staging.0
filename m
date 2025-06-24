Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A141B2C15AE
	for <linux-staging@lists.linux.dev>; Tue, 24 Jun 2025 14:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750774524; cv=none; b=pt5VTi3Ll482qVOWl0+5ZRih567vAlItEscB54Fa5RxZM88ahzI4uIq6xPQdPt6CaL4Mo2dVJN2Qyf7IDkS/O4wbLN2HcugXyZfmPDKBk609m/ZDUP43y2YChhSP3Lm34i3nLunPUGGdmwZIeGLpSfsrfoGWCJ74OT07/kvb2Mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750774524; c=relaxed/simple;
	bh=EYBB5hzcAOt18RHPivhYOpPcVF9O5sHPejxC6FiOZNY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lYqFDA5D4xwEeuQUmnfYv67M/wnxcRVU66qQSKhKXEuSuOtneg6GB/EKGFKIJ+oVbmstBFzlwQb9wqaa/C48zyb0lpFyus0ZbAkw7xZgqELg4QazxMO0h4KC+/mfNvLcf3jpEoWsqcN5n9+Q5IJsVqFi6gx5d/KY8f+gOnJQRsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OeRmoutP; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OeRmoutP"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6077dea37easo10242308a12.3
        for <linux-staging@lists.linux.dev>; Tue, 24 Jun 2025 07:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750774521; x=1751379321; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TgEeZ1NwzgeNOBBLWPbhKcGNzxqxdSNPOA/Y890PEHQ=;
        b=OeRmoutP2Wa5i9/Bt99hu1S/ur4PqH05gW2cfxgllK1EsVn39lXJ8aGgTwhuzRT1tQ
         FX+BIS7FExIegput5tegAjHkCy7EFtUmtyKytP7fVvH6RkKZERbwCDphxgGfRKCHy046
         8RvlacpsQSIKOxP+dLywP3PtJlSZZs+Q1XEXghbLnoLi/7UfX0cewSB2iiBYfAB0if8x
         Q5AxIQX8P39D/FLAN3m9Wen3mCzMpwazsHrh9wIZ1vy/TZtmNjGea1G3ZQQpnh8bt4CP
         RFlbPn8r6ExzQmt4jB9AlZqM287xorIgMMaK3/zGajTQdu+W1IDOg5QuX3feX56HOOs4
         8mvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750774521; x=1751379321;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TgEeZ1NwzgeNOBBLWPbhKcGNzxqxdSNPOA/Y890PEHQ=;
        b=u9bmDPBuo0H3lPIIpoeqR6oWWW3dYmpS1L41UqrtYOwPHcDrgCk7tS0BeroMu9G4is
         BVwFd+hNcdCzgjzTN3vjhSes5qIYt9v3uSKfbNNDiKJqJXWmg/diRCo/Gwc0f/92La/M
         qRVV39E7WpDVtOWeSWFaUVQYUR4Grefyg0SVeT6hsxogyRPcUfGdhX8q7ERwPYixj4Tr
         V+r38wBXFY1seGOyfElKfpZE9R+ggZ2Cp2V1i1jQYUAYOonGeV0t8Cxy9O6xDsyuojTq
         kNvFNY6XnCZ5tQKih1VWd2PH1du2mD4dB/87QnsD1RGyG6RYJU+nZtCKWc4ATuA4htWv
         jm9A==
X-Forwarded-Encrypted: i=1; AJvYcCXlMiGG4pkfGjHMHJOvthg0vcwxDlYssyXvEtM00XOIDGO7fUS4FnC1TIlOocEAG3UX+fCUG/P83XRb60cr@lists.linux.dev
X-Gm-Message-State: AOJu0YzmXp9AoEzmijVzwaFZcrgiUaT3AeDSUkt1Qg+Hl+M6IZn6Wxkg
	62Ehc4ivhI+ZAZn6AYVmgF+INPWIZoTdFMhEA/qn15o7uFgJIZwk4/6/VVMcsDeNb938Owm7X9n
	H+DuPF0nwH8P+XpECWprcmD7aqwbvOkXlBTfs
X-Gm-Gg: ASbGncsT2OZBPcPO8Ea/M6LaIREx/L/q9kGIwYPLsiDyWEuqpBeoW1PVS0b2sChRt7J
	PABIPsFXScVDrCx8JDCmSGheyIVV8Dhhd1w3eXJFRQseKb6pdNgCqbz4rH1Fg4LSJxGC80e31vT
	srCess3oytzfxy3cnbIX3lOqSHXoWMJmXmh8IuQ6aNlV8KuQ==
X-Google-Smtp-Source: AGHT+IEaLqgUCTgi/UDgbwhHHVKTVgJFfI8XH3ilfqmadSEjxKw9dZfOogiQ85oAjhJORbPUBGmOTbETdCj098Uck48=
X-Received: by 2002:a17:907:9087:b0:ad8:a935:b8e8 with SMTP id
 a640c23a62f3a-ae0579d1a99mr1127576466b.5.1750774520592; Tue, 24 Jun 2025
 07:15:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250624-bar-v4-1-9f9f9ae9f868@gmail.com>
In-Reply-To: <20250624-bar-v4-1-9f9f9ae9f868@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 24 Jun 2025 17:14:44 +0300
X-Gm-Features: AX0GCFuQATpLhLi-lMuhRabxfiCC90DvlL1jCZW9tpHUJF8q6CscEDY8rVRgI0w
Message-ID: <CAHp75Ve_G=ziR7sJmKw4t3BRASogGQ1kWUsNNNWESFmmS4rVhw@mail.gmail.com>
Subject: Re: [PATCH v4] staging: media: atomisp: fix coding style in ia_css_output.host.c
To: LiangCheng Wang <zaq14760@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 24, 2025 at 5:10=E2=80=AFPM LiangCheng Wang <zaq14760@gmail.com=
> wrote:
>
> Fix multiple checkpatch.pl ERRORs and coding style issues:
>
> - Use tabs instead of spaces for indentation
> - Move trailing `if` statements to multiline format
> - Remove excessive space between type and asterisk in function
>   arguments
> - Move assignment operator '=3D' to the same line for static struct
>   definitions
> - Remove unnecessary line breaks in function definitions
>
> This cleanup improves code readability and follows Linux kernel
> coding standards.

Thanks for a new version. Now the question is, is this the only file
in the whole (>90kLoCs!) driver that has such problems? If not, fix
them all and update Subject respectively,

--=20
With Best Regards,
Andy Shevchenko
