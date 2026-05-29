Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 879D33C0A0F
	for <linux-staging@lists.linux.dev>; Fri, 29 May 2026 10:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780051343; cv=none; b=AcwVOiWsLUdTVXrtCs+bYpIHsPjNU/a9VHr1Dr3AxuGWk4p7QiJHA6h35Ncs+LSxk5DI9bNBPxPdPu4sj4n6/IjiFf/ACiwd/nfwrEQSCh7nJnmJaG5wQO9iFvNwk6KkUOrfDCahRV2Sra2gz5ycWU6qY5obFRwf4XxKCSfcRiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780051343; c=relaxed/simple;
	bh=wRnPMeslTW0+cvRAOrZWJE98+u97rJM1VpwD9tt1wSc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Iu12gWF1AejNH2Bbz+BUKs/OQ5Br9t9Fsl3Q0NLkC/EJF8inWE6BAHacC5xPMmRfKk2eH1kgl8nhLytmDUIvtP3lMpRSR3gipyMqzgHmc7kOzQc/7KrsRdQe0427hAjfVBeaCLEfC5C5lwGXEEo5mrfH/oPcdFO1Dk1k4lbROBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JQvLr84M; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JQvLr84M"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4891c00e7aeso93440595e9.2
        for <linux-staging@lists.linux.dev>; Fri, 29 May 2026 03:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780051341; x=1780656141; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RBEGhCGnjZVuHyaEGRJOTaYG/mXNtIxSU7eBk1qh09s=;
        b=JQvLr84M/SA/Eda59yiqZVQ0dJ4R8buOSEJ/nQu3+UMRQGmarE3y0N12/sP+UfViiA
         yoDmMij0/9+fM0mzd1in/KRsDulVQefvudhJMrN2wuZIdzTizSIgZ972B1pzZEsb3v5R
         Tj7LEMzLx9W3xQUIp//R8kA7a942sMHyXwp/ZUUhnez/A3RddhhbnWgUMEmaqVPQpIrm
         A3GmwfQ0N3a2U6Ax4HJh1BLGQFsb2WLqAFUuTIXzkw9S66ExwyYiBlK2/RgJ7qjUhIrR
         W5TSL6n1V5R00V7BcSAr+OLloWhwHu+H/FKE+R5mEMiF6MgzZUVwOYTm/F1HDsWYcdVP
         TFAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780051341; x=1780656141;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RBEGhCGnjZVuHyaEGRJOTaYG/mXNtIxSU7eBk1qh09s=;
        b=m6OAg555qOjvQ/exwQJLpDiSxVC0eDViUZ3znBrpIvmZ4V2dBgz6QDuV89/iSoi0gv
         kKhaGLiy+eg75cXsCXh5LBtjmD+6VJnh3MQpk7i+V4Hcvq9Jdmu6+kEkfqjiVErnR45z
         oU79MDYhacyVevE6o5NxoCv3xQgO2FLJalvetVJ21y6ucf2RynREiMWfH9iSkp1Yd5Xt
         yk1QDGE+gnfkzn1DCYFE6YZHWBo1G0vxpdflD0a4utp848x9l9QZELO9Vq3aoCxsSTwR
         9D/gjROCWe+0gUS4Bf6XMXf/r+QMO593dMmi3yw+gmjVcbub9R9Jc7lwYHo48yeDhlv/
         FW+Q==
X-Forwarded-Encrypted: i=1; AFNElJ/cXqKOY+9sozqEM9dPuB7ODV32OZWVHxOI6T63Nq/mkt/B+AjFy3KuryrEd5lUSR5o0jkMiojzso06Kg7p@lists.linux.dev
X-Gm-Message-State: AOJu0YzhiskdKB2jovSdzU2IYVrIkI2prLt3GvnMIZnwAmjRTIA38aZV
	t+VgzyUTmslwW2lTV8SVGWb2UNPr3YHDyiRYqLIg8NoFOC/GiczlGQmqewnzYg==
X-Gm-Gg: Acq92OEP1/lriNg1lfFRjCYfOQVTCz3xXOe433hLOUyCHC10daD2G/SBwSoV6l8bwJo
	bXXdYxpTkWhOKlc2XLBda8aICM1J1k6kJt2HcsRQ238rsDd/08au4OMP/23MEtj1ZhZ+GlW4IF9
	bRXQwI8b9DgEikFu3alci+pEuI6hsH9dsDriGxAyOOkK/KvT2dWdaK7UaSyEAV2zHmLzYb5WChy
	BnGR634MQ03ZyhKnVbJ04Hmn7VMm3a8av6aBaWS3Yf5Imdcm4czFAFnyvm1VSn5CCjcIWeRLR2w
	b4nNjHqMHJx1b47ouRm7iaLu+nUzObcIG8bNqqYyqiBBk6mH2fZZA+5Hro7IaLeTmRN9vzFURu0
	lgWizOw7SzBRmweF1BfOBlWdQMXUNJo9nV/EEGt6vJocchgCiLOfGt2VcaVKTdswTgKD9VRhAv9
	IsgT4J0qpGuQ4496i/JwEQwcVd5BaE2Q2luw==
X-Received: by 2002:a05:600c:888c:b0:490:958f:2a5c with SMTP id 5b1f17b1804b1-4909c0aeef4mr32683195e9.17.1780051340994;
        Fri, 29 May 2026 03:42:20 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909cab0e79sm66846715e9.13.2026.05.29.03.42.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 03:42:20 -0700 (PDT)
Date: Fri, 29 May 2026 13:42:17 +0300
From: Dan Carpenter <error27@gmail.com>
To: Vitaliy Slivinskiy <phant0m.mail2023@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, dan.carpenter@linaro.org
Subject: Re: [PATCH v2 1/3] staging: rtl8723bs: remove unnecessary braces and
 comments
Message-ID: <ahltiRs7009yA_pS@stanley.mountain>
References: <20260529095503.130909-1-phant0m.mail2023@gmail.com>
 <20260529095503.130909-2-phant0m.mail2023@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260529095503.130909-2-phant0m.mail2023@gmail.com>

On Fri, May 29, 2026 at 12:55:01PM +0300, Vitaliy Slivinskiy wrote:
> Fix checkpatch.pl warning about unnecessary braces for single statement blocks. Also clean up the sentinel entry in the sdio_ids array as suggested by reviewers.
> 
> Signed-off-by: Vitaliy Slivinskiy <phant0m.mail2023@gmail.com>

Please, wait a day between resends.
Run checkpatch etc.
Follow the v2 rules.

https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

regards,
dan carpenter

