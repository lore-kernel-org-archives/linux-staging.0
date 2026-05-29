Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE7413D4127
	for <linux-staging@lists.linux.dev>; Fri, 29 May 2026 11:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780054126; cv=pass; b=mxg/2K+Hl8bhnec5rE3sTVnzj0a/P6UbGk0NJMBDHE2kKUi4wnVaC9GBKUdZHAFmVuU64otS2jQ0zB+qWCOIz4o44ANQ6QHULd/8PTrHQm9alFcPeZoKzBfXlWRfLCJgyE9ivGtyDDJLhW0+YW2slkQTfrCJyAWRExbJByFwF6M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780054126; c=relaxed/simple;
	bh=YLuCS2DFe5V+x47d8AH61ocL9lcs9DIgq8X0szPcftg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZAXxIb2qMBqECjKSScs1hrql7ozxLy+uFBg5gGc8ul6PIX9rNgd+ZRLppwzyAfDotvH44hIOCvV2Rspr27SsQEyOeb6GzW4+WBV+TXdTF8igOzN611iUTRITtQL4n1pfl0xTL8QwGE5kb6ZQzC1j/Kro12gbZHgisVU+ldqfG98=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EeAYWCxq; arc=pass smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EeAYWCxq"
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-7e66f966d01so1840501a34.3
        for <linux-staging@lists.linux.dev>; Fri, 29 May 2026 04:28:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780054125; cv=none;
        d=google.com; s=arc-20240605;
        b=K5dGPTj5xnW41b52e5fHkDssFU9X+VsmGc2rZzBOlzfyFdKndXcHh0FftoeqDyG0kf
         +xWBwMvmlAWbQHBEjyzArAxX0MHabu/zQcB/CyPR+XxhITHWUP2AfGU59CwWwQjzWaIY
         aCsA/laEwidEgGSNdQcuessqyoC6VQFW8Ry7y8y3ZwpatR8duh+FHDzeS5E1rP5H+yDK
         Ap7zWa7sRDRaTzWyiLyMcbpxku2P0ezZ9cxyuMjpp9sAPttmnpKKc+A1JsC1/z2sd3jv
         zADdw7ZLdXUz6wSD8vTjJuOtKOpgmqpAwf86Ln+5dCi49BAAxLVTo59BjzaX3D/F0BmJ
         nKhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JdvHq9PjjMTKUjtaudMigffX446OF+4GXKTZS3wR1Lg=;
        fh=sA/E08iKqKzeVmhXotDXmxcsXD7E43TOSHTDktQDCHQ=;
        b=Q3YEjSyaG53yFxFiheHxYJJB33KQS/2DsXWgDsnakDksCLfuVhiFMbpRpFwRTZMSHW
         ThWegcNbCP0JERduqBovGynL3dL/YTzH2z6nLUnwXxSgsvecr+Z3WWJs1+yieKlCJF2g
         rQluyBRxqF8IwXte8/ziDTU2jQaK/9CACxwe9FKkDY2gLn90eYBH5BzetexjgROiM25A
         b6l0/CdMYuxGd23wipKqUJVEG4KltkZFMHR5D/Z1+XHSo2FlkFCUjklqKH+JjKAhWm50
         JLukLpl1dSI337O8MCVuOSzKQs18nJxduoMDSAMrr9A6zm+cQQ8H8INMD/fCrRH8fd4V
         EpAg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780054125; x=1780658925; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JdvHq9PjjMTKUjtaudMigffX446OF+4GXKTZS3wR1Lg=;
        b=EeAYWCxqyBSVKRpYGPLvqv4wYJCcvBkol/+On0h5A2ZwwMiIWDykXhRsXHdEG+XXgB
         ZeLcJ3ARG/lCaqkLsUTsJjXM0Y/noy4bNIgY1E4IGB7Jwfpqjs/zb3scTxBnUmlrnh2J
         NaWFWVnK1O/xVBwmO0i+QNj6yl//CmrP00TYngKET/TnKkdHDCsOM5avHtU55YVU4RZU
         7XYgPg8olSK+GhHTmqXYR8If9JcuRMXPlSQ5s3+v3nYpbKBXmxqKFR3oQPKeN6Ie/NH3
         DYjnuIt0IOTOvB0a44k3Fa0QtnCxyKRJLo7Sl12gx+0l4HN/NfopUM80FiEIOs5oFyqH
         6BTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780054125; x=1780658925;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JdvHq9PjjMTKUjtaudMigffX446OF+4GXKTZS3wR1Lg=;
        b=WMm5vUP4OqTBqmrhKsDf9tRMYjDE3zC2Cu3/cflQNfUeRUIboWdlGQEXgpKRpwLrz9
         KHbSVZhvmh7suth6k8l1Ul/Qrtvunv2oTv4ikwWLUqt83YNydpAvvMaJPHRBZ26DKhFI
         +I9I3GlgW2hq7BdkxF4vOoPjgJrNlu+l77cz1vhUxdHz9wWsyB18MVfRydh3IZp+XYuo
         f+7pssNq2RpnCkuDXWoUA3ndGq5aQ28JqYHE9u3tmpbKNYl//Wf9SBRz+Xwldw62aePC
         N855zZL8PUZDCsa3nVZFibpZSb90vAgCal6bG3uoAxDEsqhrOBoqG3Ph9IIBSa7FE8VY
         Z/YA==
X-Forwarded-Encrypted: i=1; AFNElJ+2JilahFFCk//keL3Q7fZ0eKk1g0xaXkHj3F7H1E5mQh9RA3rogReo49XKT+etN0B9yEQuvHo5XKkvWkZ4@lists.linux.dev
X-Gm-Message-State: AOJu0Yy5J+hrvRisNY3/UdFyAN5Cy+NxfJfHttk0lSK60k1f+hMVQKAh
	LfiRWzLmVSbZBOu6treE2C500FImzrKWqpA0+4pWqtpcD/Hw1EF8/uNdA/guVnkN77mC6ZeysmC
	QuMpOK3PyQY9DBISQYwdZNh35Ma/+4wQ=
X-Gm-Gg: Acq92OHNJ3m8irdO8+wQIW3f8QkLthullxFd8sjF8FQONE5wxGIOvMuF0VElSnmkL3o
	neX9BovLojVzrL1Y+saaMT52tMOHNe1jU3xqMscMGx/PACr9ZdHcyF81w0o5KT2rXIxxNWai+H4
	OyrgFEx9+ix+rU+ZCyamJzFU0sk3WaisTiuOrB8SYWtosCbCSkf2khEyacCpZ/IP++0os8Xki4j
	1zE8xr4ArQSkj485S2Sw7fnDwy2KQRIqkOnHt2GfoyxdafR/6qOM0wcn5dWElAGsXeU9In/B4Pr
	JZVvOAf2cYoIMCj3op0srauilv9U8+lmjKeWPv3DPhr1POoDaQ==
X-Received: by 2002:a05:6830:4987:b0:7de:c6b8:2349 with SMTP id
 46e09a7af769-7e694d066e6mr1439290a34.14.1780054124742; Fri, 29 May 2026
 04:28:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ahhN_kiSb-yRWfiI@stanley.mountain> <20260529095233.9015-1-neharora23587@gmail.com>
 <ahltRvVgehkgvDFx@stanley.mountain> <CAOWJOpvJnSeS=1sO2mujC9tNi9_cQGgJ6S0j6xvkAp8KRnudjg@mail.gmail.com>
In-Reply-To: <CAOWJOpvJnSeS=1sO2mujC9tNi9_cQGgJ6S0j6xvkAp8KRnudjg@mail.gmail.com>
From: neha arora <neharora23587@gmail.com>
Date: Fri, 29 May 2026 16:58:29 +0530
X-Gm-Features: AVHnY4L26WI4imWVSBVQ2vF5_Su2hMUx94PxBQHISNn4E2Y9nqWEApkSa6c5D0Q
Message-ID: <CAOWJOptq02wns-MznV+VA26W5Kq9jEnESmeT9y=n78dq-XpNdw@mail.gmail.com>
Subject: Re: [PATCH v2] staging: sm750fb: rename pv_reg to io_base
To: Dan Carpenter <error27@gmail.com>
Cc: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com, 
	gregkh@linuxfoundation.org, linux-fbdev@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I have submitted patch v3 with note and Signed-off-by line

Regards,
Onish

On Fri, May 29, 2026 at 4:50=E2=80=AFPM neha arora <neharora23587@gmail.com=
> wrote:
>
> I have submitted patch v3 with note and Signed-off-by line.
>
> Regards,
> Onish
>
> On Fri, May 29, 2026 at 4:11=E2=80=AFPM Dan Carpenter <error27@gmail.com>=
 wrote:
>>
>> On Fri, May 29, 2026 at 03:22:33PM +0530, Onish Sharma wrote:
>> > Rename pv_reg to io_base to follow kernel naming style and improve
>> > readability.
>> >
>> > No functional changes intended.
>>
>> Run your patches through checkpatch.  Also v2 patches need to be sent
>> in a specific format.  This should be [PATCH v2 1/2]
>>
>> https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/
>>
>> > ---
>>   ^^^
>> There needs to be a note here to say what changed.
>>
>> regards,
>> dan carpenter
>>
