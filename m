Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C75B3375AD7
	for <linux-staging@lists.linux.dev>; Thu, 12 Mar 2026 02:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773281536; cv=none; b=Q/6O2Ta8hnpMAsQXvDQkF+p8tCLtWex7f0oPhMPuIsMYFjleJmLG8NGprvny23HSbTGxP11ePq/7tNFjNR1kz9+jspLc4F+JsVw/QZwTJhEFnmxcFJVQml/ekNuh9K4w2D+pw7+eCIHGKxW85G3rwITbsGtumlnNlYP+VIis04U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773281536; c=relaxed/simple;
	bh=gxNe5r/AaCxDltqhKTSFZAJQ56T6YCn5nOYQ1U14IZg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=PIueX4TFh8ZK6YV8dM/V/MNZaxDdzmnTQEWGpByJqmBw3GuWMLDYpSD3cahh3iJZIYXac0ggiX61oIjjpYMy7bnzwh6EccrkVPhY/FzXYpoB2kxM9NzO9dD6i399TkgG5AEwkDGuR561+K/vPO9htM9zEBhkZ/6zRoncfhUe8u0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iLtoopR2; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iLtoopR2"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-79906e5c7f1so5527697b3.1
        for <linux-staging@lists.linux.dev>; Wed, 11 Mar 2026 19:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773281535; x=1773886335; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gxNe5r/AaCxDltqhKTSFZAJQ56T6YCn5nOYQ1U14IZg=;
        b=iLtoopR2s+YOJ2wucRoxfZh9RZQQ/fA4/iU/A3ENLH1OHYyM0fm01JPjHmLSsor1wV
         yfgkJTZkx04VXGeW3DOsfBCORwA/ABcCkgE9qTo9Mdwrs9qt15+VbZjrS6TKLIrBrHMH
         jykpcRit5gu7DLzbmbkRUh6nOPQhelycCNcTZYcMbO8rRhyfMSDqSzUKejs8n4sBo944
         LfToivbuY7TTq1ngCnLz3u0iULqLprqWrOjak/IJisy2WnPNjTfjSLVi7260CrPZJxfn
         wzvZmU8rxtmBE8K+j3pCORPU1o9aY6aeNZaalEuEGtGz+7F43DTjEFIT3G4OIEk/QQi+
         R7ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773281535; x=1773886335;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gxNe5r/AaCxDltqhKTSFZAJQ56T6YCn5nOYQ1U14IZg=;
        b=vGZGXYWm5Xk0nMvpemVpepnXO38xT7/1noVFKDbzoLcGrab+pLJFCPWntE8lubufd+
         gx7Eonp6XZX6V2DtAGKlGTpayC62WnykW/FBB/brzP0rkIFu6cfx2LzaLyRU3ImZVdcL
         QuzWfb3RgKdX7FWncYLA5mNjiPFbJxhlyT4ZU/kzApTchwKGki+rNA8/kF+9KJs8tnfI
         yb6dfZXcZTrMlCY0ItY0eyftsNE1Ewe0j2HFYo2zG0FSSNWaS84V/vZI7nKCyumVjAZ/
         TUATB8XkA82A9ywPQI6U2/j1B2hJxtXuLrqMcZO5vlwo1E3ZrrpMv2kgVhV4eTOMOMLt
         ASCA==
X-Forwarded-Encrypted: i=1; AJvYcCWoXaKSmPu5IFpYYfngOM68IlEOff2R+NpZ6qIiqQdLoglrPLOIO++oGqA89/LbjktRLJnmklfiilrTWjg0@lists.linux.dev
X-Gm-Message-State: AOJu0YwwGOu2Cbbz8RV8q24Xbloc5pwn8b1cgjq7gYR1QZW2jCaWSEx7
	2Q3oKVUR8hepqdDGLYQ7PjxNgLFo2BMQYV268CWvW8hIKvG3BW0PtTPZ
X-Gm-Gg: ATEYQzw/xbqTubtK+7kWPJxgEYZcDlO5evD5DAqe3zf5xRGLHjOmqL+UYeJYApRP8BL
	Zk9DtCYhyEbPB8tL3t/ACj6tSdmRmy2uv0rbttxuR+VpLqvkPYVT+3gU9y/fIgTF73jB6v8fMRp
	8Idtf4w5XcFy4AYHX37FXpHRIDkGzL+d6ZjC1fWkUZ2z7yw/8HZoKQjedjb0Jz2qSLqVNee6EFi
	kKwylg8JAB4FKAfBnlmfU+M8f0KRtJ2mA17XzRul1T8LgUTiRrLaZh1m9m2pFSthWFXNB1vaust
	7vWZtMmKgv0CfZTYLyKqj9lQKFXwsscAQPgyVSAXrYa/5PLFMQdoJQY9UoVbTICBOJwDUxOrgZQ
	StFxN7Fh0YmDpuiDk3twcBU7Z+rRGX+0Ggaxs5X+CViu4S+20PpkWDRQbkG27WhClkaYdVTC8Dp
	ERiSKbj299aHN2Lp0veIUBNwCgCdaRG+eLK6S/mPPTffWOd/aQNCY3CLibzByBZktBeajjLa7Ru
	esudI7oneT67Kn+SW9u3pX2PADIZ0+8Ro56Lz3Xes1tkEe9mlZEII8CayWPQ4Tncl928wmEIgU=
X-Received: by 2002:a05:690c:660a:b0:794:e839:ad75 with SMTP id 00721157ae682-79917f90fb5mr45352207b3.42.1773281534717;
        Wed, 11 Mar 2026 19:12:14 -0700 (PDT)
Received: from localhost ([2600:1005:b11d:678c:3de7:a5af:fa81:a42f])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7991edd6facsm13077917b3.23.2026.03.11.19.12.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2026 19:12:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Mar 2026 21:12:12 -0500
Message-Id: <DH0FU9NX3QNS.2L2CYBXPGLZLW@gmail.com>
Cc: <sakari.ailus@linux.intel.com>, <andy@kernel.org>,
 <gregkh@linuxfoundation.org>, <linux-media@vger.kernel.org>,
 <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] staging: media: atomisp: remove unnecessary braces
 in single statement blocks
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Oskar Ray-Frayssinet" <rayfraytech@gmail.com>, <hansg@kernel.org>,
 <mchehab@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260310203646.8869-1-rayfraytech@gmail.com>
 <20260311170423.13157-1-rayfraytech@gmail.com>
In-Reply-To: <20260311170423.13157-1-rayfraytech@gmail.com>

On Wed Mar 11, 2026 at 12:04 PM CDT, Oskar Ray-Frayssinet wrote:
> Remove unnecessary braces around single statement blocks throughout
> the atomisp driver to comply with kernel coding style.
>
> Signed-off-by: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
> ---

LGTM.

Reviewed-by: Ethan Tidmore <ethantidmore06@gmail.com>

Thanks,

ET
