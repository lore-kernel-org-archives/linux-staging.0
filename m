Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43D122586C1
	for <linux-staging@lists.linux.dev>; Tue, 25 Mar 2025 12:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742904040; cv=none; b=tl1/+HccYUKccsES0Ovw9ka+gpOFYEZN8uIY/5RBYNgWnCMABbnv5GOGGENxefmCf0Izy9Bvq12TESNCpsd2cv/02BGGTPz6Slxj5UXOa8a8YhttPaUM7mD8Qb6SaZo3tzoYHkcwfn31AkEMRQmoMO5eyL4sVw+Og7PnsyS6i+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742904040; c=relaxed/simple;
	bh=b2OhConKjzvSgsnTcl2fL5GUDaph0WJpGeSsM1KI984=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UxW0HhlQpW24e2JxPZ442MnaBry9YK7agfmJgHvKwCVlE8HboThSx67B6e7GKZIwmiEiayCdi0gCWnw1B8acyM5AxsT1dR7oUnS6OoZ8ijkhBog1uqE+Zi+5LMeGhM3oEAHe7TFx8pTBnUgCaipBMVTT07vPjQRuBFhSpU+sD6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ExlB3kkd; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ExlB3kkd"
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e573136107bso5173634276.3
        for <linux-staging@lists.linux.dev>; Tue, 25 Mar 2025 05:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742904038; x=1743508838; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CnevdrSoXCo6uIk6bcR0nLToODaub7C10ZjJRxxcJ+Y=;
        b=ExlB3kkdnmslhRmzJV6puz7E7v84+W1SG31paMuyO/1KCD5b5NAUTSn3HCU8H9cWPp
         stADOmPN3v4Isd30kXBaGBUTmHHb+8/MKIXgSuaNygS7Mwyophfyd75Wxxl9RW1g28dd
         8noUfcdXDovIxw04eUBpaKf5n8McptVjMq2CTgm85muGJ+VPgwXdiT4/SSOdrq8M54xE
         a1JE9ngBU3+5jWFpCmuYJ3gJAqKfmsrysbsZHBvpzxVLlrt7iP2sTukswogIjLE3y/s+
         yWnIyV5cajSV3vA6tdoYoqOm4XbqsZSt3altfZEI3IETz7jt4VXs55/eVRCrH1f0L9Yg
         CU3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742904038; x=1743508838;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CnevdrSoXCo6uIk6bcR0nLToODaub7C10ZjJRxxcJ+Y=;
        b=Lx6K3NfSlFnmCk2enDzKvPJQEQbE74UbZ5XJgzV9dn/HxrHzAPQNkqXF/fzkL+H0Ct
         BzcTT3ZxvxUjt7EkpQ1QWCFD6c+7QG+7Ku5smnky4hvgXSoZmz/M8DxKdP709T1+5/pf
         qjHt1nO4xRM6CR3hZ55sVgARLOPULzBDQA4hF9Crkkj/yYvaGSgHiA0q6HJUVOTsajg1
         9xaUcft7T7RdkQXp8E5JrOPTFegNXyVJh2M3R2QMpPQTceZwfa9/MZz9Mb7oQ72wBXrq
         /e6bnu41WDd74/LY+1Ry9eYr6q2ZSnyKiViN++B1hCFMo12iRh8yFzgxSkB4M2kUzgw9
         SgZQ==
X-Forwarded-Encrypted: i=1; AJvYcCW1rKmmgfxCxvUvUn8W877rwZOuGhF5FyXXHKqev1FMQy6hq7gliKEfxe+YsHlKVKs+HdpYRhvs1+MO+wM3@lists.linux.dev
X-Gm-Message-State: AOJu0YxD6oG7Q2CTeIguWmm6BOVtunaZsw3BWNBVzkDTL6lEzkVb3zJA
	afZHZIxWKd9jsPywQLb5+48JKgP5Q6YbxQhkX10qF2vh6yMAG/oPQOAQFWuOAa852DMfHlL0tMj
	1Rpy6iunUGFjxcUhfI/MazhmHThU=
X-Gm-Gg: ASbGncvf7+f5ebYPHjgQMH4/XKRBjGZv2ulvC7kQYCvUki7z0XhClHm1e77RE1sBrTG
	YnziO6DGoe9rG3EQj9LMUDjh1k2F0E6IgKymiKqQiWe/x8aYOunjmaQa+0E+qDggbuAjxLFvBLi
	XrQ6x6zC7fJEzA3Eal6gobe9lBBYLvIblDH1WBVg==
X-Google-Smtp-Source: AGHT+IGIu5/NuCLnAVC4CwB7tKr+pW1IvXMHLfQddMFlTu1BRQOatTVJFYfTSGg3D5iR4Ev+dEuYNeLjzXsJzAIIKj0=
X-Received: by 2002:a05:6902:1ac7:b0:e63:f25e:68c1 with SMTP id
 3f1490d57ef6-e66a4fac372mr20419441276.34.1742904036331; Tue, 25 Mar 2025
 05:00:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250319045212.72650-1-simeddon@gmail.com> <Z965Rz8NuXhbHrgy@debian-BULLSEYE-live-builder-AMD64>
In-Reply-To: <Z965Rz8NuXhbHrgy@debian-BULLSEYE-live-builder-AMD64>
From: Siddharth Menon <simeddon@gmail.com>
Date: Tue, 25 Mar 2025 17:29:59 +0530
X-Gm-Features: AQ5f1JoLIpcp9qEnovJpq03xpcbqdCTU9IxuEWqZb4IANYiAHmkxj7qd5cXRz1I
Message-ID: <CAGd6pzNW2JKxTfQ8rLD8V7bdUgq8fc0R+ayChf3J0VdRm9Ptrg@mail.gmail.com>
Subject: Re: [PATCH v3] iio: frequency: ad9832: Use FIELD_PREP macro to set
 bit fields
To: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
Cc: linux-iio@vger.kernel.org, lars@metafoo.de, Michael.Hennerich@analog.com, 
	jic23@kernel.org, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Sat, 22 Mar 2025 at 18:50, Marcelo Schmitt
<marcelo.schmitt1@gmail.com> wrote:
>
> On 03/19, Siddharth Menon wrote:
> > Refactor code to use the FIELD_PREP macro for setting bit fields
> > instead of manual bit manipulation.
>
> The word 'refactor' by itself isn't very appealing.
> Instead, maybe promote how the patch improves code readability saying something
> like 'Use bitfield macros to clearly specify AD9832 SPI command fields and to
> make register write code more readable.' Use that exact text if you want.
>

Thanks for the feedback, I will update the commit message.

> I think AD9832_PHASE and RES_MASK could also be declared as a mask, but maybe
> that change can be made on a separate patch.

I shall send in another patch addressing this.

> > -             st->data = cpu_to_be16((AD9832_CMD_SYNCSELSRC << CMD_SHIFT) |
> > +             st->data = cpu_to_be16(FIELD_PREP(AD9832_CMD_MSK, AD9832_CMD_SYNCSELSRC) |
> >                                       st->ctrl_ss);
> Not sure about this assignment with mix of FIELD_PREP and non-FIELD_PREP value.
> Maybe have
>                                        FIELD_PREP(AD9832_DAT_MSK, st->ctrl_ss)); ?

From what I understood, I don't think that would work out. AD9832_SELSRC
= BIT(12) but AD9832_DAT_MSK only covers bits 7 through 0 GENMASK(7, 0).
 It could exceed the maximum value allowed by the mask.

Thanks,
Siddharth Menon
