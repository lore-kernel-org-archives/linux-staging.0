Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6290230FB0;
	Thu, 19 Oct 2023 15:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marliere.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=marliere.net header.i=@marliere.net header.b="StJU++p7"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-5b5354da665so2933688a12.2;
        Thu, 19 Oct 2023 08:58:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697731102; x=1698335902;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:dkim-signature:date:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7HkHJ/8jn2JaOF0xO0UppYJ9aqH2RJuNpshWIljvl7w=;
        b=t4PAoFlslMZOXX3FNs8jyI9In3JVYuGbLUXqauvYNkusBhaXTNx630heA+GvHlD5bL
         eFtlSR41JXmjAZTHp64MsCJWUSo2U36As/jw1ADkxJTAxd61SSYORF5wlvwLRykBSoC/
         C/9+fm6bsISVZetJ3yAirzzzGO8ti95+eGgH3jRDuZfZ/pSaZQfPq0JUxO+tmMlgTIS0
         mpdyAnalpeQISb81nUtOyCn6bEgst6jkVBfuIRP//0/vMOtCXiSbExj3vdjahamR8APD
         TABuqOHfGUcU2THESxXgMFDMllDMdk46cf1WTwsZutqfirL4Pt49oLYXgbKnCgkr6yJP
         hjeA==
X-Gm-Message-State: AOJu0YwbTE+itmTnJSKzRhzkHQw5ahA9zjXxJT1MWWLtCmzwoG6tva4r
	rmZ9JCeH/f/0HAI/l4BzYVQ=
X-Google-Smtp-Source: AGHT+IFbcwL8YPhXgfA4W2vECzu+u6WZn5lBg2HAq0L3cmYhQ7QhOkS02frRF/Lod55u5Zb2RwZvZA==
X-Received: by 2002:a05:6a21:35c4:b0:174:52b7:f63 with SMTP id ba4-20020a056a2135c400b0017452b70f63mr2506957pzc.26.1697731101527;
        Thu, 19 Oct 2023 08:58:21 -0700 (PDT)
Received: from mail.marliere.net ([24.199.118.162])
        by smtp.gmail.com with ESMTPSA id 22-20020a17090a019600b0026801e06ac1sm1897920pjc.30.2023.10.19.08.58.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Oct 2023 08:58:20 -0700 (PDT)
Date: Thu, 19 Oct 2023 12:58:15 -0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marliere.net;
	s=2023; t=1697731096;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7HkHJ/8jn2JaOF0xO0UppYJ9aqH2RJuNpshWIljvl7w=;
	b=StJU++p7NDaYYEnkeqTs+2D31flndIsU9T60N062eZKw/jes9r05JvNRPl/Eq1UDxzDJt/
	vrhvrj1WcOFA40mTS7TGAxQXPwg884I+L+PBIk3H999B0jAhjbcAQU7C6GWc8RztlSEuOP
	MwXAU2hKIjLhMnEel0coubYKf6SqL3k8s7hURHc0ePPNLO1k5xBDmcqiS+h2vv4/p8TUzy
	6YRzLHAEkqceplw3KyHGNxLirec6yWEpv3szPsXZW6QNV2IpBa8B03Z7TrQ6iEldqiNHmV
	ZbvxdQtkr64rjioEBXSEYd209cC4XgRN4rY/zHoVZKaU27l+m+uvbUZlCYpcuw==
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=ricardo@marliere.net smtp.mailfrom=ricardo@marliere.net
From: "Ricardo B. Marliere" <ricardo@marliere.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Calvince Otieno <calvncce@gmail.com>, gustavo@embeddedor.com, 
	outreachy@lists.linux.dev, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: vc04_services: remove empty functions
Message-ID: <yj7xx2g3b3jmuxuvqotum3gyekd64lbrgjz42kafy77gu3n34e@zibkzqy4d4tu>
References: <ZTD677iqMkRPxT27@lab-ubuntu>
 <qqvbqinun7wbhaz47i6sk2awplknwbrfutrwfpvj6wq4wgdie6@smhzxank6val>
 <2023101908-bouncy-dandelion-da1e@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2023101908-bouncy-dandelion-da1e@gregkh>

On 23/10/19 05:29PM, Greg Kroah-Hartman wrote:
> On Thu, Oct 19, 2023 at 09:50:07AM -0300, Ricardo B. Marliere wrote:
> > Hey there,
> > 
> > just as a heads up, the vc04_services staging drivers seem to be
> > actively developed elsewhere [1]. I'm not sure how they plan to upstream
> > their code later.
> 
> They are being actively developed here, one the staging list, whatever
> out-of-tree stuff will come after all of the required fixes and cleanups
> will get merged here and then the out-of-tree stuff can be added later.
> 
> So no need to worry about random github trees please.

That is good to know, thanks for the clarification!

-	Ricardo
