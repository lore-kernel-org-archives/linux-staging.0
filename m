Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A1B8FC1C
	for <linux-staging@lists.linux.dev>; Thu, 11 Jan 2024 09:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JAHi2m5G"
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-dae7cc31151so3949763276.3
        for <linux-staging@lists.linux.dev>; Thu, 11 Jan 2024 01:10:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704964205; x=1705569005; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oXjcPmzG/A7mlaieQ9giQPRodlEupSyhDif0JeD6lQU=;
        b=JAHi2m5GAfDGgJNj49lBZ48YDqcVp0rocj3SEXLsOFwvYzk2Fo3LurmRLUGJ+BsxdQ
         Ls4n1KPPj8QYoxKd0nP73EvdL7vUZ+9fhd53WCjtvZrZbPMMRQ/Ed2JKNpdLdZonnHRa
         5j3P+uSXD5DRF8TcexlBMyeJt4FzjgQjPboI1aFjIwTL3psxHhK35ga8ifIYJ/+2ZeFu
         5gl0JK3q37RqHqXxlyGGhT7s++2l8Kobqap/Hzx7UMw0L7K6h20cNIxDIo//jeMSYpUY
         Kvh6AWoswchwtKdHlUEFMJH+9vY7yL0WbREcYPKOiX3gVs7zTVCmcIKJEc/wSz85oCik
         UYMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704964205; x=1705569005;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oXjcPmzG/A7mlaieQ9giQPRodlEupSyhDif0JeD6lQU=;
        b=boQF+hB/zvW1SVGvnkUP0MgvtfLcM4q4qjuQdb0TghBvNdDrkLa7vye48t2SdKrW5T
         feOOsnJ29KkfQSvDpujOkXdvTqHLCq7j31EawIP85wsdPfXKcbWizcmTumkapL+tvCD7
         TeRYccK7G2TwRN6QqhuIFCOQ7TqTwykDzkkuWUupjTWWnU9UUlFOO/TTXHfr5btqEqZ+
         VhUnFKa3XQqK92oQV3KWeuuCvFmibx3sPKGa3KgeDYxntOo2u959HvM6q/4KtTHEOqEI
         GZpYOhNoTMAiuAgG8i+Kb/Cmy2omgHW+ffHuEmwB4cgWedw1PbhrdqGQ8f9nPyYZcUge
         55zg==
X-Gm-Message-State: AOJu0Yw/qtd02UEpibAf3xYKHFwKD4BMqZNDDQPUN3FXGTMMr1UIh6Ti
	0ip5t9mglCpkV+bfTENI+GkfrO6ZfGoU4RKgdvg=
X-Google-Smtp-Source: AGHT+IE4mcy7QGOY4i1Yr3rQGg5S+FuyePKgtStKpiklcSlnUuoIo4BONjaCFhJ0DazKy1raPRL1X2pu+KuJC2vd4U0=
X-Received: by 2002:a25:8005:0:b0:dbc:b48e:6426 with SMTP id
 m5-20020a258005000000b00dbcb48e6426mr789726ybk.110.1704964205393; Thu, 11 Jan
 2024 01:10:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240111070652.71717-1-pranavsubbu@gmail.com> <2024011144-silica-viral-9e79@gregkh>
 <CAP1Lp88vEZJtd69Njf9uZ5VXypwZ-5vLdBHf2xoLSpqmeyEQiA@mail.gmail.com>
In-Reply-To: <CAP1Lp88vEZJtd69Njf9uZ5VXypwZ-5vLdBHf2xoLSpqmeyEQiA@mail.gmail.com>
From: Pranav Athreya <pranavsubbu@gmail.com>
Date: Thu, 11 Jan 2024 14:39:54 +0530
Message-ID: <CAP1Lp8-CP-uELVam=18oADOEvL_13wXkTyDLHKbjQe1ZyxiG9g@mail.gmail.com>
Subject: Re: [PATCH] staging: vt6655: Remove extra blank lines between code blocks
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Forest Bond <forest@alittletooquiet.net>, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

My apologies, resending this as plain text.

Greg,

Thank you for reviewing my patch! Shall I amend the commit and send a
revision of the patch?
If I understand you correctly, I should remove all mention of the
.mod.c file from the commit,
which will leave the new text as such:

Adhere to Linux kernel coding style.

Reported by checkpatch:

drivers/staging/vt6655/rxtx.h:22: CHECK: Please don't use multiple blank li=
nes

Signed-off-by: Pranav Athreya <pranavsubbu@gmail.com>
---
 drivers/staging/vt6655/rxtx.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/vt6655/rxtx.h b/drivers/staging/vt6655/rxtx.h
index a67757c9bb5c..be1e5180d57b 100644
--- a/drivers/staging/vt6655/rxtx.h
+++ b/drivers/staging/vt6655/rxtx.h
@@ -19,7 +19,6 @@
 #define DEFAULT_MSDU_LIFETIME_RES_64us 8000 /* 64us */
 #define DEFAULT_MGN_LIFETIME_RES_64us  125  /* 64us */

-
 /*---------------------  Export Definitions -------------------------*/

 /*---------------------  Export Variables  --------------------------*/

Yours Sincerely,

Pranav.

Yours Sincerely,

Pranav.


On Thu, Jan 11, 2024 at 2:33=E2=80=AFPM Pranav Athreya <pranavsubbu@gmail.c=
om> wrote:
>
> Greg,
>
> Thank you for reviewing my patch! Shall I amend the commit and send a rev=
ision of the patch?
> If I understand you correctly, I should remove all mention of the .mod.c =
file from the commit,
> which will leave the new text as such:
>
> Adhere to Linux kernel coding style.
>
> Reported by checkpatch:
>
> drivers/staging/vt6655/rxtx.h:22: CHECK: Please don't use multiple blank =
lines
>
> Signed-off-by: Pranav Athreya <pranavsubbu@gmail.com>
> ---
>  drivers/staging/vt6655/rxtx.h | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/staging/vt6655/rxtx.h b/drivers/staging/vt6655/rxtx.=
h
> index a67757c9bb5c..be1e5180d57b 100644
> --- a/drivers/staging/vt6655/rxtx.h
> +++ b/drivers/staging/vt6655/rxtx.h
> @@ -19,7 +19,6 @@
>  #define DEFAULT_MSDU_LIFETIME_RES_64us 8000 /* 64us */
>  #define DEFAULT_MGN_LIFETIME_RES_64us  125  /* 64us */
>
> -
>  /*---------------------  Export Definitions -------------------------*/
>
>  /*---------------------  Export Variables  --------------------------*/
>
>
> Yours Sincerely,
>
> Pranav.
>
>
> On Thu, Jan 11, 2024 at 12:52=E2=80=AFPM Greg Kroah-Hartman <gregkh@linux=
foundation.org> wrote:
>>
>> On Thu, Jan 11, 2024 at 12:36:52PM +0530, Pranav Athreya wrote:
>> > Adhere to Linux kernel coding style.
>> >
>> > Reported by checkpatch:
>> >
>> > drivers/staging/vt6655/rxtx.h:22: CHECK: Please don't use multiple bla=
nk lines
>> >
>> > drivers/staging/vt6655/vt6655_stage.mod.c:38: CHECK: Please don't use =
multiple blank lines
>> > ^Ignore the blank lines in vt6655_stage.mod.c since *.mod.c files
>> > are included in .gitignore.
>>
>> *.mod.c files are not something that you can change, and are not in your
>> patch either:
>>
>> > Signed-off-by: Pranav Athreya <pranavsubbu@gmail.com>
>> > ---
>> >  drivers/staging/vt6655/rxtx.h | 1 -
>> >  1 file changed, 1 deletion(-)
>>
>> So the text is not correct :(
>>
>> thanks,
>>
>> greg k-h
