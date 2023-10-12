Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB05E22336
	for <linux-staging@lists.linux.dev>; Thu, 12 Oct 2023 10:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iZ0bJv3H"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-323ef9a8b59so742384f8f.3
        for <linux-staging@lists.linux.dev>; Thu, 12 Oct 2023 03:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697105708; x=1697710508; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nGBRtscR5XFDxdOEvFyr/E+oy+5VNzI6usKYmeqNS50=;
        b=iZ0bJv3Hx2Se8WwB9b24ZVBD7yavQYadrVmNJO2Dkc7SeBTmOROK7GdTDug5YkOHiL
         z7LYbkzXH2Q0pSuuK75DxBh5SND3tqXv/c9AhQpCsMVWVAQsi0wLhPgVz3EWd1YzLrTV
         G4QDKFZW4qEmrjdCu0pCFWpt5v0RKZsJZXTROX2T7sremrLeQ0SueNtMng++Ny128q8O
         agwFBA7VHp9YVMvwd0i+UPOdhqIgHlxxmmJmRZrGcACtolao+83Mplq5BVbFcBcA+ZL8
         s6fX3HWaINGR863NHzD298DVO/p91/Jdx7zerTraY46XJIyYMewVKHgJ8sFZ/NCYhidL
         vSLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697105708; x=1697710508;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nGBRtscR5XFDxdOEvFyr/E+oy+5VNzI6usKYmeqNS50=;
        b=XmpRmkot/RMhOnK7TVh+MJA5onXJpAOl8dyEiuKtaO/y7/H4ULHqQN0ivKrFjah5WR
         qKRJFJ8MoijoLb00NCQWTBwFIsV9INnVmZap/q3sswvQuYfkiC3GZiiZrVfOtVLzvYPt
         YFqTK8ssdnZz7d/EPejPzBnXlESjyQOKLoFyhunfNeM+7ZaB/XZBQ4jDhGhWupZY7Kcn
         weVkC0hPjztpvX9cwMzogpUkUWGXDS4V2rgh15q4L0VOueltx44wpc3Z8wAEdGUzBmws
         W7vibtrGYMG/rFsyduBdAAk5mUr+vkc5op1m3P3usCB+z5Dyz2tDLDa3mY/XUV9L5NvH
         DESg==
X-Gm-Message-State: AOJu0YzNEoexl8xMPyDAh9McfledZMNwycrkIkAUPgsaG2o+yk9+8fMm
	w1h6Eqo40aq4/kY7TpCWpUgIUQ==
X-Google-Smtp-Source: AGHT+IF7ZOB1GpuF5uoZtYv82cP81Ykcjmt9UppAs2wf1pmdfGmQref1xRyVHDZlDqgkcVFCb/HFmQ==
X-Received: by 2002:adf:dd82:0:b0:324:84bc:d59e with SMTP id x2-20020adfdd82000000b0032484bcd59emr19004327wrl.22.1697105708075;
        Thu, 12 Oct 2023 03:15:08 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id ba18-20020a0560001c1200b0032d8a4b637bsm2981997wrb.22.2023.10.12.03.15.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Oct 2023 03:15:07 -0700 (PDT)
Date: Thu, 12 Oct 2023 13:15:04 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Calvince Otieno <calvncce@gmail.com>
Cc: outreachy@lists.linux.dev, linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dan Carpenter <error27@gmail.com>, Archana <craechal@gmail.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Simon Horman <horms@kernel.org>, linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging/wlan-ng: remove strcpy() use in favor of
 strscpy()
Message-ID: <848becd6-9f65-4316-a2f0-ebf2ed2f5758@kadam.mountain>
References: <ZSeD1UojAgrsOh16@lab-ubuntu>
 <f0c12a00-ad9e-45b2-9cb2-7a84f4f10ef9@kadam.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f0c12a00-ad9e-45b2-9cb2-7a84f4f10ef9@kadam.mountain>

On Thu, Oct 12, 2023 at 01:03:40PM +0300, Dan Carpenter wrote:
> The simplest approach is to do a:
> 
> 	git grep strscpy | grep " - 1"
> 
> But the better approach would be to write a Smatch or Coverity check to
> prevent these in the future.

I meant Coccinelle not Coverity.  Duh...

Also btw, sometimes we want to keep the "don't necessarily terminate the
string behavior".  That's rare and ugly, but it does exist.

regards,
dan carpenter
