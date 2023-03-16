Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCAC429A5
	for <linux-staging@lists.linux.dev>; Thu, 16 Mar 2023 11:19:49 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id o6-20020a17090a9f8600b0023f32869993so1072577pjp.1
        for <linux-staging@lists.linux.dev>; Thu, 16 Mar 2023 04:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678965589;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CE8IAcAlJGofU0auUpkBj3SZTwG2IY5t+92rZgQyMe0=;
        b=ZHqt9gNfBWEu7jIsvlExzvqCTxSHRu5cX31lmBzovRNF5Pb38ilOr3RrsgVav2uNB6
         e6+FZUsbxOHZrypJ/ozP994Xa8KMxXMF0Pn4ldsmImDo9TMHf6aMPPLlhIhPVghfHqYZ
         WHk4RqtPJxrPM3O0xU4M4W4zwbInntc62c3OUI+xxHMwim0tOfnPL7ZmHyj75ZHnOMc6
         NQVAKde5oq+/BRpjDjMXUF/qB7zSOjuWqd+FuLTnjsNC6Gi4FYMPBazLomBv4eW4zyjR
         70+PEXidzGpCNO4bzhDsbEqueCStAIMZamYjMCCZjxRz1QpHeQSKw3Q481TYHZtqTO+P
         UZvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678965589;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CE8IAcAlJGofU0auUpkBj3SZTwG2IY5t+92rZgQyMe0=;
        b=IL87xlUTP0aPkr76rjh3XbNai6obDbUH34rVpNGhjEYbIpuDxKbOduTBRkhYprYeqJ
         KFXdmct2WFowX2CyXhm9B+b63qCdzTWUOALz81mcsA8HnWn5n2F2U6vGJbev0qqPcHJ/
         xay4M79nVxB1kBOSVseRSVIUSqdPNnFJ9pJ5k7/1XkkALM22/6VOB1LDI5q3bhS1ZJ6a
         lS4ejB9QbXD1dD69p3QeVFMjsaaYESLzzyZHuWkDY8//v/34WKIFMJAwtWHiqPCBAuIE
         TLh3u7v/PN/Er9a+OtCwxhgE9YDqw0vr8yzRRbbb5RRdolslSEqZPDyLnOEKaNCGEwEF
         9hvQ==
X-Gm-Message-State: AO0yUKXLeZx4qyPZSPRB+gLux88XNYagZQUwaIxWHay92ibMUDKZkpIR
	Ak2pgd6OMgZ5v7nlOvZopY8=
X-Google-Smtp-Source: AK7set9+Vc5m8YKnWqzZ+F9qOTF2Z60/JLNvOOsPjmFZ9uGgNzuqokkUKbjoKWWqtoeL2COvYA/x+A==
X-Received: by 2002:a17:903:2906:b0:19c:d6fe:39cb with SMTP id lh6-20020a170903290600b0019cd6fe39cbmr2802528plb.7.1678965588980;
        Thu, 16 Mar 2023 04:19:48 -0700 (PDT)
Received: from gmail.com ([20.230.228.239])
        by smtp.gmail.com with ESMTPSA id l12-20020a170903244c00b001a0428bd8c4sm5315013pls.289.2023.03.16.04.19.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Mar 2023 04:19:48 -0700 (PDT)
Date: Thu, 16 Mar 2023 11:19:46 +0000
From: Archana <craechal@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: drv@mailo.com, linux-staging@lists.linux.dev
Subject: Re: [PATCH 1/2] staging: wlan-ng: remove unnecessary kfree statements
Message-ID: <ZBL7UucjbZiWBmLl@gmail.com>
References: <20230310205917.2161-1-craechal@gmail.com>
 <ZAwwgsZd+2OAD1DM@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZAwwgsZd+2OAD1DM@kroah.com>


Hey,

- I am not sure why i am getting the description error. I had
  sent a v2 patch version on which i haven't received this review.
- My real name is Archana.

Can you please guide me on what is required from my end to close this patch?

Thanks,
Archana
