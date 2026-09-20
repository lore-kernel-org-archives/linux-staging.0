Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C4DD472558
	for <linux-staging@lists.linux.dev>; Sun, 20 Sep 2026 18:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789929030; cv=pass; b=IDbV0DrotKyihJkiEKt55ibsAW0Q1lnwNbWNtqn68bV3kRsfOmEFphfMhXj/9fG8KmmbIANg+3dyfprrrRjlctJ+NBOgvKRU+GrW/TWOasTMeooAk1q9dU8h5fDtyOxDltl96WijMzNGgiT1ZtGPO84c7h6nhmRxbqOMU59DnG0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789929030; c=relaxed/simple;
	bh=FKCEyfg1kyoQKkvyPDSZQB8QNOiucdD/LjiJ9D/YVh0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lhvEP4t90UO3UpWfKwn8uS+r1ACukJ0SXdPiQ47/lmafAfwx0ni9VDSySLkkQSZwbTPCh/SqBnrHbBZgnI9IIMyvlkwpMNGKFdNIn7KBTelRSZUydc51tuahhJO0RgwuwtwEE7n0ZOG65WRp9cJST3Ih9sbtfaZrt7rvM2eU4m8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RK1fG28S; arc=pass smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RK1fG28S"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-52fb766bfd8so21742571cf.3
        for <linux-staging@lists.linux.dev>; Sun, 20 Sep 2026 11:30:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789929025; cv=none;
        d=google.com; s=arc-20260327;
        b=fozQmjKowjS2OW4bvwDkFCTJFfnAihEscPXxymsHjAZWl3UH+SXnFVnL8ovOUHKI41
         U9fn1stIGfpgOxx/9Sj1mpvq4c0noODPppfWuU8hXg4m7t5g6d+H3qCtQZivaUXlQ5x4
         zpXR0fdckn0lYGS0MhJUiZwRxmDMYCF+v5RS/VG8t8UYqGlPs66AMBNuIvF6IBys7O0E
         W0/RSOO6OZl2FKwfHOQuVsiptE42bl3VNfJHz0E8OElyuX83/BMxlKvUUNpoKyAIlnxc
         1HfmPlU0cNsr1yMcQ/r9sGlvu02XN9z7g4lsF6wkkFmW3W7dXE90ku3u11nDLzu9QPuj
         U6iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=FKCEyfg1kyoQKkvyPDSZQB8QNOiucdD/LjiJ9D/YVh0=;
        fh=3BrIIqLBf3HorMcmggiO6hLnYMJeYvlBqQE/H7Km/JA=;
        b=gHloiQgpGQ4uKAN3ujeyUGGmTESUVWmkIQZVtOQpuspixKBih6iFUjYmFkUIljuH5V
         RbeYdT/GnNlx2OI7Br662aur5l6H+1Jo9TgkGzUkcBXcBx9yKR55bc9ple3eGMq1OXPw
         0MK267/x1duXIRe9WWzcYRRX+4Uo3g0WWl5RAAv50zPUwZgBdmHKAb7P0f8gwiXBnGP+
         zizs6UWg0d1fhUe69M6OBxHIgT7HxF1EjI2LACAPRZzQW92tkz3RdKFsi3xy5dIGJZvG
         WKjGajC/WICd79reBZjORJ6QUR0iZGseBrnlgFo3CyagBXt6qfhUstoMCAf8MpGXmXVe
         lzog==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789929025; x=1790533825; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FKCEyfg1kyoQKkvyPDSZQB8QNOiucdD/LjiJ9D/YVh0=;
        b=RK1fG28SjidZYsuiYwdGXgzNMHkV1vShDTeJDMun7+JKhKHfZgls3hJdhhWH7SPTN5
         kHrhYIf2iDKKFHAUkrcYN43P6KONs5rZMS8Oef8RL1/Mi2XqZlnOP0BYGBLN/dGFt8CJ
         A6MUtujTi6FIQm4q3G9c+xJlfGmsDbAwgyrEBozaglxYN3gM20OWcgNR09s+N01UlViD
         UCExM1lKnyAGLEVGlDDiuCS07Ji9oI7oAAIFsIexVU6VM0YyIp7JFx/bjkvlV7eqnAtP
         f1V7pbQnsz6j5wFrXmSjI5E/N36MdqfNcXzSCatx1jytUSBYEKdjxcFGq1P3pEP+WWj4
         GT/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789929025; x=1790533825;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FKCEyfg1kyoQKkvyPDSZQB8QNOiucdD/LjiJ9D/YVh0=;
        b=PHl0Vk8VbSTOCxV79SZnHQJR0p33Sfp8msEhYdlfRaTDBctPyC4/YK6acTNAxidkuj
         eAYA1iYbq3Yo2u/xm0NcRNG/V0SXymd02O5ILPl9pGl2kyquPPP28RakcbNPA5WE2uWg
         hgAGOhDPMFUXak71kkpYAecIoi9dEoM1yoPzpdA2+B1E1GYfUlyKqs5weRHuUhtqRzVh
         VyIZjr/iejHzVqnTzgWnSX50+xPZ7jCqETuO07heq9J1QU6tJdgUk5i/FXQyicRUu+1u
         Q2j9YZohuQpPhqAaxq0Zvk1XUosdjfUh9VbH0cV17584GpuO+6Uv8Mcd8pg6bd+YH71K
         58jg==
X-Forwarded-Encrypted: i=1; AKwUvBx3aoPsDt/QTaZsfYQP6sBvCSh9HCqLvuAKjBsCpKci7x2LrdOUv8wwHL1DoSIwvzlZevv+OJTmMP1v8z2J@lists.linux.dev
X-Gm-Message-State: AFuF++lKXMagLFO4Buh1laya9gQy8rb7x+19rn7xEBwZtwwN7zssQirU
	psrdJSNMw79xdwCujRM+nbOixtyhmOkSHnCSMGWgQ4+wi/3uJPfUKFbQbF0Zhx2pWVTx8pmbqg3
	7TGlrsquOHuYFmNC/kXQ3noE1p9zMtwM=
X-Gm-Gg: AYBFou0qg9iu0nD2hFjOfDB7czPY+J9NeM6YUzScTs18T2s4tOdC9wQJb57WP7KCPU1
	UrvdWn53EEU04+AVR81QKOw3LrhD8wjVtLWQ8ybcE6iInJxJDxdgn/P4OQBD4lRIGRiJ4lz8Z7A
	E4EKkxDgLuxGF+2SVfBEh1WyFV6VloxstVdw5bcr2MxEdYt+1VuEdxE2gtT2JHW+NbYItkLqLQW
	z4It6RQfCt+S6Q45udQAWzHLdMI8O3nfnSBA9GEO97GX8J4fxg8RnGtR/h27rEWvNxPPxRKHJQO
	dmcRNczML1wrLEHzcB+sy88d+/jS3dAYL7fe53pc7NlZRZ+/4rld4VeQsVIwA8NdKOliAjzfnXz
	+z2ys/zUbuufV
X-Received: by 2002:a05:622a:5a1a:b0:532:acb9:5953 with SMTP id
 d75a77b69052e-532b7343d9dmr67177321cf.31.1789929025258; Sun, 20 Sep 2026
 11:30:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260920094058.9664-1-palaomer100@gmail.com> <2026092039-greedily-jailer-80e5@gregkh>
 <DLK2TDB5QIUL.1X53SKJTROLDK@gmail.com> <ea6cf31e-0acd-4248-9359-5864bf8f6f94@kernel.org>
 <b33efa2e-75e3-4163-ba1f-712227b438f8@kernel.org>
In-Reply-To: <b33efa2e-75e3-4163-ba1f-712227b438f8@kernel.org>
From: =?UTF-8?Q?=C3=96mer_PALA?= <palaomer100@gmail.com>
Date: Sun, 20 Sep 2026 21:29:50 +0300
X-Gm-Features: AcwNN1VyBiPlzPcXjoGv8BVs7qS-DsxYSqZXrQgC6ZmVEyZokGmq-0S-p4wn5dU
Message-ID: <CAKhZXnrnMvZTUiUwtconm+rr3OBy4fpvDcvgxhToVkNED6QH2w@mail.gmail.com>
Subject: Re: [PATCH] staging: greybus: change mutexes to guard macros
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Vaibhav Hiremath <hvaibhav.linux@gmail.com>, 
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, 
	Vaibhav Agarwal <vaibhav.sr@gmail.com>, Mark Greer <mgreer@animalcreek.com>, 
	Viresh Kumar <vireshk@kernel.org>, Rui Miguel Silva <rmfrfs@gmail.com>, 
	"Bryan O'Donoghue" <pure.logic@nexus-software.ie>, David Lin <dtwlin@gmail.com>, 
	"moderated list:GREYBUS SUBSYSTEM" <greybus-dev@lists.linaro.org>, 
	"open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Krzysztof Kozlowski <krzk@kernel.org> wrote:
> ... and if you even asked your AI like I did now:
> "how linux kernel developers look at LLM contributions from beginners?"
> I got:
>
> "Linux kernel developers view unverified AI-generated code from
> beginners with heavy skepticism and frustration due to a massive influx
> of low-quality submissions that overwhelm maintainers."
>
>
> "Rejection of AI "slop": "
>
> "Staging area bans: Certain high-traffic areas prone to beginner
> contributions, such as the kernel's staging drivers (drivers/staging/),
> have implemented strict policies forbidding LLM-generated patches ...."
>
> Yet you did exactly what should not be done - were using LLM.
>
> Best regards,
> Krzysztof

Hi Greg and Krzystof

I didn't use AI to generate this code. It took 5-6 hours.

I don't know why you said I used LLM to generate this such code.

Krzystof wrote:
> So you received feedback from Greg, but tried on different part, hoping
> this time it will get accepted?
>
> This looks similar to you previous approaches, e.g. for DT bindings,
> where you received comments and repeated the same thing immediately.
> Three or four time.

I generally write 2 or 3 patches and send them parallelly.
I won't do this again.

I thought fixing some spaghetti code and changing mutex_lock/mutex_unlock to
guard macros is fine.

Best Regards,
Omer PALA
