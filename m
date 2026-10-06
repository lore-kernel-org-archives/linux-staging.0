Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9015D3BB10E
	for <linux-staging@lists.linux.dev>; Tue,  6 Oct 2026 15:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791299449; cv=none; b=hE+kiOV8KJEfZ80dXnVkeFiFiW3Frf+Wf9UcQhjkRVh/v9lmvtOcvGTmEDcZVaVRbsPivNYMu2bW0tcbOnInIZVRFDSJE3VUlE98EOWdw0kiMF58cR1yDe2yiONNMr37Yvk0dIRPL0KwvTUIY3gB9x37AJdZeeX3AVCiLvE+kBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791299449; c=relaxed/simple;
	bh=CZzQYMQ0CaouLEUN3WcNvt6IGP+hlIKiFum7Ja+K3MM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DLzm0mfK3jx4EYjZrz1Ey2Hwv08axjfbRHM96wsAyjxCRGwR4DVvDZORfDkmvPtKM1I+7yZMEvJtldUGFH+PaefanT8/TkSA0KREOTgdV+1aY5eZr4OlolJhRHgsD6/y9SJdrbcpZgSZv7mBsPKLuNtu4Qo4rIpY3T5Fapm75k8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mRYasXsc; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mRYasXsc"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a16c399641so8944415e9.2
        for <linux-staging@lists.linux.dev>; Tue, 06 Oct 2026 08:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791299446; x=1791904246; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nmOy8UDU42FfjcKIpdai+HCHqrBu8cVwJxEwsCYIUb8=;
        b=mRYasXsc/JdGK2wyAvX0x+kEXFJBhHEe9HZz3YGKe1cxocGU0d+UfFu+Pcm4DX97ZD
         WKkhFpL0/BjAES6Xf5npJanBEPeTnoY5q9J5BYCw9OW/qsG3lTcXtZk8L8lznErAA6aO
         n8Cs5FXRn3I0t6nRA6h6bP8xXhOiqnMStHYCbf8PJdvegFlDVp2eqjBtcvi63NsqvA0a
         cPB2dkyUYvXyogRRkqnVrjzsbB161F9JawAzztz2FWNLMjaiSRDsP7TQPl7BoMJ+een/
         101gz7hjoNi2b76wU5IUpG8RJL9+BflhAvXJIAJ++vqqoyMcUqUh281AH8YLV8b2Xiau
         c3ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791299446; x=1791904246;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nmOy8UDU42FfjcKIpdai+HCHqrBu8cVwJxEwsCYIUb8=;
        b=HrHC/gebgkhypSRDsX080YN9InyRuEpo3xVVz4F6oijGjO8NpU5FTYwFrKCEdfN/kh
         t+4oYokuc4wIKFlpPXmF4G7k6g66RPX+/H9Dr/TTpbK6NWOR/GDKlYx39gq2gghnT+ox
         MryWWLU5lC09DGZOljubu7wuYC9pSHk1z2Qd9XiyBKP4NifPJMzNJmfYCpqqd1kcNsMo
         pT7OzHwotRioVlkjEnmsSD6dClJbiNXFCNYc7JN3ZeMxJhShJTfoM123K4zsZZ51jRcp
         s+1CPjhUfe5x2Gcb7CgV3cEx99Q5ECXhgnVZ1smuRT2heQWCUst/pE3thd/BkoQUIesN
         vm1w==
X-Forwarded-Encrypted: i=1; AKwUvBz3XmIBQwlYf2r1bmIpt2EKEYKxEV6HgExhyxMld6rpRg/FXAenMtwTYyphqZVoui/Ao3M4x2kLc10RVGx8@lists.linux.dev
X-Gm-Message-State: AFuF++lsihJ+PEZt53El9sggMMov/OxRopCDiBKh/K0059CVfoIKX3Wj
	13dxqV+acbOvbilyE5/RYo5/tHpSSfqWn4PHOi7jiNcgspkxEpp+Mk0t
X-Gm-Gg: AYBFou1Sk/yCOZ5G1lNyiOPpwfvuJUYoWVzqGOlQ/GWAHiXmD3ByKKsEMTdNWKX88kx
	WdlkYhG6mGYYcyxNqZJ/NU0QQS/uRo90HX/3ZwT2r4lgLTrJfp7dC9fp7mfBrdiKV50jWZjxHsb
	SGtxZy2q6zGbejkOZJ+LfW9w8GrYT1qRSlpjWf6YNHGCkyOWsdz+4+5sadkdeZB22TgzeJlEcvw
	BxJ4s+iicJBzMJtfizmTXCkMOCGdLWSM4u6tIcbr+ZpBpfZWoQmubQH3BmmetKE0RYCkzlluvfT
	7oTQHSLx5H6xbq9HMsJH4pSt7KY5j5Cj2LGaSiMsHl5Y7/Tmrq7/P8YS1VjhDqKU/TZ6E5vQubc
	FDfuuidPMW+GKNdvRh92r33s3VTwu1Hy+Isp3PhGNBNcOftvCedFZ0SK6tgxBGWOeS4W2J1OL6/
	qMSTQMuXr0twfqgMlG6INOwIIqdY4RyUtoX1aBP9t2YbDqtqGL7Uh0u2te4qRTb/eswuvzb5NJd
	5NaRtCivKXCR+JUpS0OEukwBGK74P4pJKtrv/QVoVHxqkWOWv2GfEkmPtn1G25+N4ermtZU94+k
	0xx6KAYHQE6qDjA99Z946jDmDCiuaLF9khxkBc0HJSSWu69V8nfU0KEfW/92vJofvvFj1eVTk8a
	bdk3bZINyNGDTOFERY9KWQWj2KqZB4KHqm8aFBY1pJnLtCVJ3iwv374EwETrpeQqqY4oPGCStpw
	vhJ8JJwVXGwNGWmxI=
X-Received: by 2002:a05:600c:4e11:b0:49f:bd3c:bc24 with SMTP id 5b1f17b1804b1-4a17b554d8dmr27260815e9.31.1791299445565;
        Tue, 06 Oct 2026 08:10:45 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a17a0fc2e4sm73243025e9.3.2026.10.06.08.10.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 08:10:40 -0700 (PDT)
Date: Tue, 6 Oct 2026 17:10:35 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
Cc: Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>, Michael Hennerich
 <Michael.Hennerich@analog.com>, Jonathan Cameron <jic23@kernel.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, David Lechner
 <dlechner@baylibre.com>, Andy Shevchenko <andy@kernel.org>,
 linux@analog.com, linux-iio@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: iio: adt7316: use kstrtobool() for sysfs
 boolean parsing
Message-ID: <20261006171035.00001ce2@gmail.com>
In-Reply-To: <20261006103350.32853-1-abdelnasserhussein11@gmail.com>
References: <20261006103350.32853-1-abdelnasserhussein11@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue,  6 Oct 2026 13:33:50 +0300
Abdelnasser Hussein <abdelnasserhussein11@gmail.com> wrote:

> Replace manual and unsafe character checks (e.g., buf[0] == '1') with the
> standard kstrtobool() API in sysfs store functions. This ensures proper
> handling of standard boolean inputs, fixes potential safety issues, and
> adheres to the Linux kernel coding style.
> 
> Signed-off-by: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
> ---
>  drivers/staging/iio/addac/adt7316.c | 94 +++++++++++++++++++++++------
>  1 file changed, 77 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/staging/iio/addac/adt7316.c b/drivers/staging/iio/addac/adt7316.c
> index 20f6052cc7fb..21a1b811a142 100644
> --- a/drivers/staging/iio/addac/adt7316.c
> +++ b/drivers/staging/iio/addac/adt7316.c
> @@ -246,12 +246,12 @@ static ssize_t adt7316_store_enabled(struct device *dev,
>  {

Please also include linux/kstrtox.h.

>  	struct iio_dev *dev_info = dev_to_iio_dev(dev);
>  	struct adt7316_chip_info *chip = iio_priv(dev_info);
> -	int enable;
> +	bool enable;
> +	int ret;
>  
> -	if (buf[0] == '1')
> -		enable = 1;
> -	else
> -		enable = 0;
> +	ret = kstrtobool(buf, &enable);
> +	if (ret)
> +		return ret;
>  
>  	if (_adt7316_store_enabled(chip, enable) < 0)
>  		return -EIO;
> @@ -285,13 +285,18 @@ static ssize_t adt7316_store_select_ex_temp(struct device *dev,
>  	struct iio_dev *dev_info = dev_to_iio_dev(dev);
>  	struct adt7316_chip_info *chip = iio_priv(dev_info);
>  	u8 config1;
> +	bool req;

Hmmm, req is a pretty vague name in my opinion. Ideally you shouldn't
use super short variable names unless they are self explanatory/common
(like ret or inx). What does req mean? Could be request or required...

(Perhaps I'm just nitpicking).

Otherwise LGTM.

-- 
Kind regards,
Joshua Crofts
