Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B860F1DED44
	for <linux-staging@lists.linux.dev>; Thu, 17 Oct 2024 18:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729191537; cv=none; b=qo9zQbALT0CGl3GR1zUaKgF1m/8JGbOfbU6WtK1Jzt//39C9b+p/CRaOHzdGD6FEdTAFwpmRJjzkcK6/wNfk9POjNp24jRpQtq0c1T2nn2+XokmuBouxyVUQV9tfkNUsFZjK5ETJhpT3/4/8f7fSaKVaquRyQH9MkjX4fTMByvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729191537; c=relaxed/simple;
	bh=SNtE+TAjJ2JdWb/jlOvN0PEbD8g1WcfFzQ7DNQOC190=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qiv5w4Z2wI3P0SILgfD2oqvh99lxc5ZXA6MpjSoBu+abzjWmB2JQs+4Hd/x9IsnDyMMUDANoKB11G5Z1NPMA2AEM7hrE5HX0MlFXY99HAN7N/JX4wQaiU1avhEgCExbZmmK6vL7DAF64vZ7LEl7oGI38UdX42N7u4/imWDPKEWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HP8JBUhJ; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HP8JBUhJ"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-37d70df0b1aso971746f8f.3
        for <linux-staging@lists.linux.dev>; Thu, 17 Oct 2024 11:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729191530; x=1729796330; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0jNM0fKmT2OwKByfCojWNdXKNxzOOYUDB2waNLdpO7Q=;
        b=HP8JBUhJSb5BztRnm6vccEpYk+bt/vjag17pkSi7J2C9s4DW22Wz11jIzMvTDWMGLo
         pGtPnreYWI3ZN75aH27UQfZl1QAVxhTSTfcSvOeJaLLerR6emltNhfhGgLfbYJSfSxfr
         yucIWsHr0rm0te13PXhG8oXDnWtGx6ez/QVpV3Kqji7SOLifojtyErE0TXk5Xb1hs6HM
         MKhSgY/TQ06VAAznX0L7KfWfkzFzlHYcl+1Vh/vrCkPGcK7fbABd0NDJ50Zawv/VWjuU
         E+gfxUoZQ4fcV3QQ3AJJ8He0CrLWa1xtoIAnho3+AQho3Ff/bgqd5Up6DibcEegdHUtZ
         CTKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729191530; x=1729796330;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0jNM0fKmT2OwKByfCojWNdXKNxzOOYUDB2waNLdpO7Q=;
        b=e1VX4IehR0b46zb6zIoRE0YLAajd0cwVCSMEwiBKGXSGJ93zNnGWXxBAjTltRYQhgG
         kF37+r6Eo9zcZC6WEqDgo9wFc76NusvJSqhcJjhB5djNsbKvaScfqyO9c4Xx28Dvdew0
         axmv8tx2OIMUCVlTK0ng3CE+r2uYpkP+qGZ1DXT7a9j++4lFTnnZWyfiB/HstD1fC2Bu
         USZ1Se9WOA59/1bXbz2H12Wm1go0wcCQjPyBtoPo5kmt+vO47nvQwI56dN0aCqc5om09
         SmEUO6TrHjehrhWhn4eVR3yhHSbOKQQw2Pqs32Q/A0Wsk7ftFR/3/RoHm0jmDZQ+Pgh9
         tiew==
X-Forwarded-Encrypted: i=1; AJvYcCV5QqbpQS/UuzRTXC2kADBTg4HB5W7gyO2mK9iPcglyn0FKJquJjrTcsLIOHWnZeAhQauC4DZxJw5xheKkx@lists.linux.dev
X-Gm-Message-State: AOJu0YzJXtMbxv3xmEE49HOuldZvg+vnbzMmBtHoTKmswLkRQBWuRdsN
	2VyUDlHrDTI3yBApEbWDr6dy0y+vQs9PUPE9CSHEqJa63a2pP2EZYlX2sri5LGQ=
X-Google-Smtp-Source: AGHT+IF9kUUjfTLr6yM602q+fe8hCO6wIbB+sJWSe0YZkcfYdPlioijykg/CoyWhRs0AzdbysOwD0g==
X-Received: by 2002:a5d:5192:0:b0:37d:5496:290c with SMTP id ffacd0b85a97d-37d86bb6740mr5003470f8f.7.1729191529891;
        Thu, 17 Oct 2024 11:58:49 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c98d4d6586sm3037384a12.7.2024.10.17.11.58.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 11:58:49 -0700 (PDT)
Date: Thu, 17 Oct 2024 21:58:45 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: "Everest K.C." <everestkc@everestkc.com.np>
Cc: Shuah Khan <skhan@linuxfoundation.org>, dpenkler@gmail.com,
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: other staging/gpib bugs completed
Message-ID: <c5cdbc20-5d45-4054-99fc-062608168e1a@stanley.mountain>
References: <912561b9-e446-42e8-8922-9e8952355c79@stanley.mountain>
 <CAEO-vhF0NWB4J+WFu_c7Nn9tu_kYzAvNeFgLrLKc_Lk5DD51hQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEO-vhF0NWB4J+WFu_c7Nn9tu_kYzAvNeFgLrLKc_Lk5DD51hQ@mail.gmail.com>

On Thu, Oct 17, 2024 at 03:29:21AM -0600, Everest K.C. wrote:
> On Wed, Oct 16, 2024 at 8:20 AM Dan Carpenter <dan.carpenter@linaro.org> wrote:
> >
> > Keep up the good work, Everest.  Here are some other bugs you could fix if you
> > want.
> Thank you for all your feedback and help. I am learning a lot :)
> I will look into these and try my best to fix them and send patches.

Feel free to ask questions if there are any warning messages you don't
understand.  :)

You also don't have to do fix any of these, of course.  But I didn't want you to
run out of bugs.

regards,
dan carpenter

