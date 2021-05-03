Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1572271
	for <linux-staging@lists.linux.dev>; Mon,  3 May 2021 08:17:22 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id gx5so6561328ejb.11
        for <linux-staging@lists.linux.dev>; Mon, 03 May 2021 01:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=77KhqXo0QBF6RGlrN2kWUFurTxeMNqFSVmZ+axu4LH4=;
        b=XWUyiZ/d1bfkT4UVXLKP0F6Bzhkk1iNKw4YzflzImtzvlFX0MVaV3BCoIgm31oTVtR
         QXhrgbukVy7OOpCX+IFhYn88Gk/XphHok0cHLs3lPqo34LfvYfA5WiLRyJ93m1EG+Aov
         LF/V8mYCKzS4fQqM5bnDKcX8lQoRnpAPfMQ0eDhTzOTxyOnMMNA2Vjx7/yNGrszLMtP7
         +hI/WiddkeU5SOmJWzCl7QbHwwjI4BANabbk6MrrKZWwBBJF36UsbXAjq1BjwJm0Yd0k
         QXWAtpUUCZAQettHCAaU5dHj4CNVBU6OyezKEewIFrzq66yZCga3Rn9pbq2bbnTiMJPE
         0/6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=77KhqXo0QBF6RGlrN2kWUFurTxeMNqFSVmZ+axu4LH4=;
        b=Q5x8bNH0x/S7AvCziP/3uPFxajQdqB/DBPJXy1b2xQAIRKB3c6DQIt2OVIDvpI5lPN
         MTOcHbrJqkrmp0GS2Q35Pyu2MRsTPmqaRkTxe8qAl88+23hVbWwpzpUffa2wu1eQDVxl
         stcOcGXaCPdSM/ihtIA7TA5LVex0rz6svqtsnMjZAv0nQRLyYlfYHO5lHhwi5zdqDGG8
         gJ5qB83ad0tGS/wdsn7faH31JBV1XCMyiX7AdwIKQRvQw7xPmvzbxumWp5FxjACJvHaG
         BwnN+Hh/M5gMP2sEy/UNcTmXSnPWwchH3RD1boqObuu9uZif29jm1oGfTj8aF4P05sfn
         VULA==
X-Gm-Message-State: AOAM530VY0eCYuR5RDBSwkyJWu0nNPB9FGTce0uwi9HAwXoiMVmVpl9p
	O4vyskTCdBUXNPpNuUO1a56n9XXAxB7TFA==
X-Google-Smtp-Source: ABdhPJxOwXppQuGqR19R1WbSVbXwft+mGphzpQfBtxabOL+mXgAWCEcHN5YC2U6VdycUTGeCH0aCgg==
X-Received: by 2002:a17:907:3e06:: with SMTP id hp6mr15539540ejc.273.1620029840676;
        Mon, 03 May 2021 01:17:20 -0700 (PDT)
Received: from agape.jhs ([5.171.72.252])
        by smtp.gmail.com with ESMTPSA id r10sm10829843ejd.112.2021.05.03.01.17.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 May 2021 01:17:20 -0700 (PDT)
Date: Mon, 3 May 2021 10:17:18 +0200
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 00/43] staging: rtl8723bs: clean up driver from
 private debug facilities
Message-ID: <20210503081717.GA8953@agape.jhs>
References: <cover.1619794331.git.fabioaiuto83@gmail.com>
 <20210503075201.GN1981@kadam>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210503075201.GN1981@kadam>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Mon, May 03, 2021 at 10:52:01AM +0300, Dan Carpenter wrote:
> Looks good.
> 
> Reviewed-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> regards,
> dan carpenter
> 

thanks Dan,

when a tag is offered this way, am I supposed to resend the patchset with
the offered tag added on or it's just a tag which Greg is going to add when
accept all in his tree?

thank you in advance,

fabio
