Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB74477F2E
	for <linux-staging@lists.linux.dev>; Tue, 12 Mar 2024 09:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710234368; cv=none; b=Ehjdds4PoB8d5ZNQt7ceDvOk0LLkk4+VZY8TmuaeWENX3v0Xj1K2eW50QT2Mg6O2X/K3xajMHeA8/dvU+e5vyZT5AoEnjpQ4JWjwJseMufrxSyotESOgntE3imInzr9AuYH8WdfkXjTC1lkyNNXO/m4+zn+2kWCnTKDDZsNpQhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710234368; c=relaxed/simple;
	bh=xJXtaBA08CJQ7wZp1LsDWo3O9eXpGvNkX0ALzUkIiAk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qa3MJ4ZHevR4aMwNxJsMrtuxm+PpxCOD4Xwnhyrpg9E30vD941GaH9BrnCYEWLfkM78+4UoqCKaSjJNn48BIKKblxQrBTBq0HoyE+nb6Ox+xUxgsIq7app40sT2wuLN1Os4LXyO8mfERBjZmoRuHmDLDNow5mOOaUd9fb2HDX5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=o8Led9+T; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="o8Led9+T"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a3122b70439so664787566b.3
        for <linux-staging@lists.linux.dev>; Tue, 12 Mar 2024 02:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710234365; x=1710839165; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GF2Syo3clnYBOqKcfzEliTm1lj0XlDsoPVwTUC8i/bE=;
        b=o8Led9+T8b6OyMbQ8bDafjhsndrYm5FU2G/WT7xzw65qGkFubGQ4980qEE2qXYyWGj
         qNNPCjdM+zcs2UDAlbXP5fwS9lFjNJr1kdkyStjyxnlGQTIliGT0G4SNV7m7XwNzKTnS
         JlyONr8Jx3CWMRs5hsochJE/kXJnLzY40p1ZPJloGCRAjzR19E1+9GKHL6kud9S/1Sx6
         o7JzHcXeYUNkcUQI9kk9EfeLjwuovvM+ONGPkmO6YJxn/VwaFShJ11XkrKuFkhy4dFtG
         3KdhRwwvptILSs10wx12bhQqHmbfTHvYIPtbfgzOZyIQzRA9DAFnGX/5Ixf4DpmKIXSL
         KzAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710234365; x=1710839165;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GF2Syo3clnYBOqKcfzEliTm1lj0XlDsoPVwTUC8i/bE=;
        b=nAF2fBKSfskGEma85CzsekpYgPl1XS8KkRBZcSdWNN8mddzbP46WbILcl/sX5aLMtp
         NRp/JZmoZXk/EAWHB+dQPPIBuKnT9CjbS8dYVTYHfl9fXgDUgCdutfBJ/X1Vz8ZvKf6R
         BpVJ77hClB00RCiszcq5U10eI0FDKV+SHTL/nq/Q2gGzfg3eCpfgw2CmHwUpX8MWIMRI
         1vFf5MeBXuCLSyVVZ9ABHZSpkq24HacMOOVzmN9C8+tpv9MP6Eh9QdVSj26s9flwoBo1
         q3Hc2QFlG740LkkVRKEgje/vY4AyKq2ioRk7o+ZIbrqzWHrqx3+ZXz3n8D4FpNRkKSvN
         ycIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXjaNpg7RzjjpR6lbbfTWm2vwvkWTfaVEr8I5S2MgUUM1cXmteWQ546t4/Y2/RXqpdSLz5Rb5pp6BDYLq+KR+L/nH3anbIwx0ORLVSNzQ==
X-Gm-Message-State: AOJu0YzYozzJKvZnWDZ0Mc6JEZRAClrdgXG0GRc9Ns7PhzPhAyK9ESNB
	+i5cPQp5xrJ0FrDW8cAPi2ro3HtzCB5FQibArACY+mT/FJEd0PkfGH0XPnMsVUc=
X-Google-Smtp-Source: AGHT+IECTtkVFXHQj+8/2yUZqtRCHjC+Zcl1H3VxfSmiJOzGD2qP48df52pGfPMonTdlZd0DNYsb3A==
X-Received: by 2002:a17:906:4551:b0:a46:1e69:a336 with SMTP id s17-20020a170906455100b00a461e69a336mr844973ejq.22.1710234364632;
        Tue, 12 Mar 2024 02:06:04 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id bn25-20020a170906c0d900b00a460040a102sm3494349ejb.124.2024.03.12.02.06.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 02:06:04 -0700 (PDT)
Date: Tue, 12 Mar 2024 12:06:00 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Michael Straube <straube.linux@gmail.com>
Cc: gregkh@linuxfoundation.org, philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8192e: replace variable with direct return
Message-ID: <64141031-4bb9-46fa-9adb-ea1a7056945d@moroto.mountain>
References: <20240312051816.18717-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240312051816.18717-1-straube.linux@gmail.com>

On Tue, Mar 12, 2024 at 06:18:16AM +0100, Michael Straube wrote:
> Remove the variable rt_status from rtl92e_send_cmd_pkt() and return
> true/false directly to improve readability.
> 
> Signed-off-by: Michael Straube <straube.linux@gmail.com>

Thanks!

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

