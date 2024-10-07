Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12B3A1D6DBE
	for <linux-staging@lists.linux.dev>; Mon,  7 Oct 2024 15:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728315971; cv=none; b=phAURemDy/ZUztDRM7C6Y8DlG6zIyZkxX6H9K+IiGDlz3MsOCjiJM6MfAzAo219xG/vj/37zS/uJly9Xyusj9TI7KVAMO/JK2IMSGjn9Nq0g2prw2tE3SJRVX0wA8taETqr3bgk3cjcrcNCXHtiTh+pXoryI9AHokrvwCRTuYlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728315971; c=relaxed/simple;
	bh=IPz+aGl2hpLhDFrX5GfJESiSDX1f4cE9gll6GUH7TJY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YlA6v6UukloKWGf0MO4saVwsrQ7zfJcev5qiqw/f+hWBhbqTNPAzZYN0CzLXKGzbLfACwChLtS+BYHVAfv5bpVZ0Z3+Gax9DXKi1NCB+Y7y02OwUDzQvb90Wh5t7AjLwvoS5at6r9Ay2/qC7bRVgVSA2dPms5qJOItRj+w5HY2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QJZZ5bx8; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QJZZ5bx8"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-37ccdc0d7f6so2989111f8f.0
        for <linux-staging@lists.linux.dev>; Mon, 07 Oct 2024 08:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728315968; x=1728920768; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=n6dprjm0PLZjMBeHgDbl3Q6+Sj+1Lh0wF19FbiiI9Hs=;
        b=QJZZ5bx8OZO8n+6xQdMrFUBDvB4uY2XWNeZ3xe5CqZDu6WsKi22VBDdm1ssFaC9jRW
         vKnS2EgXkpvfEsMxRFn8woRhuxjInkJw8yOmRn+Hx+6eXXgUKFvtn2F0oOVBsUccB2Yp
         KAsUXAS2+Ol9s5olpxK/lkME6xfum4bdNB9wswjkG2eZ6mcRc4aUAEKY5H7R7QoaA6GL
         SGmBpyi2gGQkU7DrLp1NxXu72ugoW4k5vWVIg3J/V4ZF9B9fJbMMYQL0+FwGpTVc+7RE
         dVUq+ESRBV37dTpcekot4/sI1EtlQi8IGOwkX6KKQzZzOkJeG0FcmtQ61iP8MoKJvm73
         BqRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728315968; x=1728920768;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n6dprjm0PLZjMBeHgDbl3Q6+Sj+1Lh0wF19FbiiI9Hs=;
        b=TJouD2U+P4LvPBnCfqd/n71PvMwwH3h6/2ImJgIQGWn4PQWxHADm6o6xuvrktzi8Tm
         vKx62hr37CX2+EqVnn5z1cHMY4ouWt+H4wy2NiqDJehrITkF257kVz0HV48VDZA3HG9n
         mdGj7LPOKs2ExZKRUIJQPOf3+0vikV1Ore3Q4QDd5YiVyT11ApKn/UpDjTqgwW1pPJSr
         XplenVaJEZWku4bZ30mulwDQFvKpI+AdTTBTWz545LI8bNN8cDRC5fr7ieh9QDuGrZN1
         9T0BFZ0QDTeFVyHcH9Ucp8HfCj9VNRR71Qmcg3g3Ce+Tp1GJhPCdgCI5hSPl0VBkUba5
         roNA==
X-Forwarded-Encrypted: i=1; AJvYcCWrVqkU8Qodf9PRCWgE6li5Eu7iAxBzC7ESAJTzIGK8vS08WQK91zcy/J2sIFVyvRcSEdsOQeXLHN0sUJdS@lists.linux.dev
X-Gm-Message-State: AOJu0YyYAhKVJB06sH/CzHWNdwxf7Z1C7TqfYsZpHIJM7uAYIwXnvuQ5
	Qvvn7V7WMslJuhkaYSzlUPWuPOJqE5omrCCcoUmsiZ2SqG48mzpJ
X-Google-Smtp-Source: AGHT+IF+8sfGIn0BZv8JEm8l7fv06gDZuaryeZmXzbmOn6DC8csfkugDv/BvinOfUhgQEn85h8XL9g==
X-Received: by 2002:a5d:63cc:0:b0:374:c31e:9721 with SMTP id ffacd0b85a97d-37d0e7d40aemr7238976f8f.42.1728315968206;
        Mon, 07 Oct 2024 08:46:08 -0700 (PDT)
Received: from redaops ([146.70.124.157])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f89e89b42sm77975205e9.13.2024.10.07.08.46.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 08:46:07 -0700 (PDT)
Date: Mon, 7 Oct 2024 18:46:05 +0300
From: Tudor Gheorghiu <tudor.reda@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Nam Cao <namcao@linutronix.de>, Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-iio@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>
Subject: Re: [PATCH] staging: iio: frequency: rename macros
Message-ID: <ZwQCPY7tmMg7ciVZ@redaops>
References: <20241001202430.15874-2-tudor.reda@gmail.com>
 <20241001225426.wUBOFdMi@linutronix.de>
 <Zvy0qyQJP1S17SFv@redaops>
 <20241006122712.2cff065c@jic23-huawei>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241006122712.2cff065c@jic23-huawei>

On Sun, Oct 06, 2024 at 12:27:12PM +0100, Jonathan Cameron wrote:

> 
> Hmm. If you really want to clean this up, then these macros shouldn't
> exist at all.  They are legacy of ancient IIO code style and some slightly
> ropey code even then (which is why it's in staging!)
> 
> Right option is to use the read_raw callbacks in conjunction with the
> info_mask_* bitmaps that indicate which attributes the IIO core should create.
> There are some corners in here such as PHASESYMBOL for which we've
> never fixed on an ABI and that might need custom attributes, but even
> then these macros probably wouldn't be involved.
> 

Hi Jonathan!
Thank you so much for your input!

I understand, so this is not as simple as just renaming the macros,
there is actually a lot more to modify in order to make this driver up
to date with modern standards. I will leave this for the original driver
developers.

> So I'd don't mind 'fixing' checkpatch or the code, but I'd
> rather we fixed the drivers up properly.

As for this, it is somewhat unrelated to the actual driver (I didn't
even consider this initially). That is why I submitted a different patch:

https://lore.kernel.org/all/20241002133418.7924-2-tudor.reda@gmail.com/

Thanks again,
Tudor
