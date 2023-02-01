Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09C087F4
	for <linux-staging@lists.linux.dev>; Wed,  1 Feb 2023 06:16:12 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id d14so16237726wrr.9
        for <linux-staging@lists.linux.dev>; Tue, 31 Jan 2023 22:16:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=43QZSGZeU/cV5AUl6DL3ZEkjlzFe9GKndh8lRkabxOs=;
        b=by/kQctD1VEeCskvu0Qs94/FFwDrKfWv766kkqiUy8Oly1jomKj0ooirqkNjAWzSnu
         CViRBXEkJCxwhWzsDj0givTbl1dLdjqborUXckrrkD4ix7H0EawA1dm+9ZuTn2ajmMfq
         amU77FfeJ2HtlUhYWHqEZih3J/qk4M5vkZHnaTdWYBN7lLzZytJ6t6+nyfWz2UH5Apmu
         ki+2+IL0cg1J/9iJiKO6EPW2DfcsxIlV5SQQkvOF798/ICCcDbkGWRVROerrFJh0+MZp
         xgbR99fhm/O5s4MD3iEAo2BFV28kos9PXYguZx1wne7QiJdqpffBd0QNf8kH4kYGjl2q
         CJrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=43QZSGZeU/cV5AUl6DL3ZEkjlzFe9GKndh8lRkabxOs=;
        b=ZThx9Ou2/z8NJ0XbWMvAnkpiJCw9PDMjOD5OK5WYeZ+IwTtoc4Zqgwa7/ARJh+WOIw
         ViRi+Ud/0zJUDbhjLDoeHXILLBgqTSFofPiEVUn+OLf1ZqcRMQ9uclhxL9XikVFTgAdd
         /yvTaP9fyGXwJ2CCCOd0umjxGbuq8KwFvL+pknV5RLjtVWwj+Eef8dzyg3NOeGAE7R98
         RvMhECriDxYFE3g1EcP813IL/xBJ/JYKlzj0Hw7iXkyMYZjWZZucXMbvMCR0oL9tVlEV
         bj6K87BSCm+7rx6K4kzK7GL7tPhPNSIn6a6Ys0gQJR5stBBqjS+vIVtcllk1ylJ+sjti
         ld3Q==
X-Gm-Message-State: AO0yUKVcB0HbVWGrexWisgr4jVXbkWza3fNtMpZQmIX9ukpYHONpiXbi
	ub1YsoBSx+/sgxy+3RdfRK4=
X-Google-Smtp-Source: AK7set9TArx9hwV4sIFA7TxpurE4lv+V0FhZ0CkKESKuyyrgRc/j7kutLtRz0Lkblse0PBblIiuyPQ==
X-Received: by 2002:a05:6000:68b:b0:2bf:c1f7:45a8 with SMTP id bo11-20020a056000068b00b002bfc1f745a8mr1503541wrb.4.1675232171295;
        Tue, 31 Jan 2023 22:16:11 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id q2-20020a056000136200b002bfad438811sm16660963wrz.74.2023.01.31.22.16.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Jan 2023 22:16:10 -0800 (PST)
Date: Wed, 1 Feb 2023 09:16:07 +0300
From: Dan Carpenter <error27@gmail.com>
To: Guru Mehar Rachaputi <gurumeharrachaputi@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: pi433: Added information about bit_rate
 configuration
Message-ID: <Y9oDp4X6cO8iB6vW@kadam>
References: <Y9laj+z0TuasBRx5@combine-ThinkPad-S1-Yoga>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y9laj+z0TuasBRx5@combine-ThinkPad-S1-Yoga>

On Tue, Jan 31, 2023 at 07:14:39PM +0100, Guru Mehar Rachaputi wrote:
> Information in the TODO file for bit_rate configuration is
> insufficient.
> 
> This patch adds information on how to approach when considering
> to modify bit_rate to support upto 300kbps.
> 
> Signed-off-by: Guru Mehar Rachaputi <gurumeharrachaputi@gmail.com>
> ---

Thanks!

Acked-by: Dan Carpenter <error27@gmail.com>

regards,
dan carpenter

