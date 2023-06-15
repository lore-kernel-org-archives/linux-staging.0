Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D117F15AE1
	for <linux-staging@lists.linux.dev>; Thu, 15 Jun 2023 16:11:17 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1b4f8523197so7160975ad.1
        for <linux-staging@lists.linux.dev>; Thu, 15 Jun 2023 09:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686845477; x=1689437477;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SHFSwygxeSP/wb+9cpN9Yh89Hq/EoNysOuT6jZLAZPA=;
        b=a5jrDgJ473r5kUIlYrgUMKKspLnXEM1iePB/RAqvLVO8KXD8ipIU0S+BvsIY8KzL+o
         e8GvYpDS/83Hz6b0ZR42lyNdIMzhOWiEQZhU8AZO/H6FSOzz4Ui5zYW4zWlBl8afGgDh
         7U0ls7TCNFrf9BAyDY3nqDgQ3e3ZbAJo/qVmHnAzTWgcNcQdsJdmPOXOxHKqmHwNaomN
         ZbRLK3jOeBoCHKUOejfkcTXGfQSkuB/BRx9K2QBPUooCYgrKb9s4hyzOztelOOxEhFCA
         ICSEPIJXtYiFtR7viy2efTNdfT3eA6C1+EAr2vK31EprWEcTkN3cvPFM5pUjJn7seq1+
         kjpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686845477; x=1689437477;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SHFSwygxeSP/wb+9cpN9Yh89Hq/EoNysOuT6jZLAZPA=;
        b=iDoHEZhEdjR7RvJL5tJxu80JCmC5eZ/insX3gTk5iOaKJ4K+KZvqJRU2YyplxaZbQr
         aVxKs9z9wWeCrQa/NhjHsxhHYPd7G8ASO+fJ9KMRxmwEGr/NkvizhzsxAhE/mi83PB+0
         +3qtvHonYQBx+LGr7EM4eDEiUlnTxHyN0MMnosEuEvTQxfvqRdksxIRUttIfEc1yxUC6
         WaDyWgcIni1llxnJrIHvylDt32eWD9CFkrHbS0ZSb/MQYHrtR5R+ojSGIj+5FGCT20lm
         eJ3v9oSMOQU4q4VkiUERIGM+EUKEL6tLYGvyELPBHZQWbaSpdbnVcH5nLLbOy6OL/Noe
         sJeA==
X-Gm-Message-State: AC+VfDwSdGQ/LsrNgtwAR1CoIIhjgcchF1lvrTB53RLku9q7qQGEeOtc
	MwPwyg9XJh+V5NmlMb2Dkzw=
X-Google-Smtp-Source: ACHHUZ6cwPkh6elQv6ZZn8eTE+1VBrzp0IAE9+SSpS4WlT6sTPwAuiG+jAMOY0L6uDaHtW0Y4Nr/yQ==
X-Received: by 2002:a17:902:dac4:b0:1a9:6a10:70e9 with SMTP id q4-20020a170902dac400b001a96a1070e9mr7036413plx.33.1686845477059;
        Thu, 15 Jun 2023 09:11:17 -0700 (PDT)
Received: from yogi-Zephyrus ([103.251.210.211])
        by smtp.gmail.com with ESMTPSA id a17-20020a170902ee9100b001b5115b16a1sm2125682pld.94.2023.06.15.09.11.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jun 2023 09:11:16 -0700 (PDT)
Date: Thu, 15 Jun 2023 21:41:12 +0530
From: Yogesh Hegde <yogi.kernel@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Philipp Hortmann <philipp.g.hortmann@gmail.com>
Subject: Re: [PATCH v2 0/5] Trivial code cleanup patches
Message-ID: <20230615161112.GA42873@yogi-Zephyrus>
References: <cover.1686149467.git.yogi.kernel@gmail.com>
 <2023061532-fall-earthy-c429@gregkh>
 <20230615140908.GB37552@yogi-Zephyrus>
 <2023061520-gear-unwind-fbcc@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2023061520-gear-unwind-fbcc@gregkh>

On Thu, Jun 15, 2023 at 04:34:36PM +0200, Greg Kroah-Hartman wrote:
> I don't know, sorry, that's up to you.  If a symbol is used in one
> module, then of course you can't remove it :)
> 
> don't mess with the modules split for now, just get the existing code
> cleaner, that's probably much easier, right?
Yes, clean up is easier. I will resend the v1 patchset. It only cleans up the 
variable names leaving the rest untouched.  

Thank you all for reviewing the patches. 

Thanks and Regards 
Yogesh 
