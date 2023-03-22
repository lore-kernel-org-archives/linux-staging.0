Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 953658C01;
	Wed, 22 Mar 2023 15:10:06 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id ew6so11312208edb.7;
        Wed, 22 Mar 2023 08:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679497805;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WpIyrmn2yFb8HSkTpZJfQ2BkuEU1rXMevxKx3lamqmg=;
        b=T5MC288NL/lXi2UWgAiHdCLCQhsnlEys+1QXJDxx2MWjgiMOHMlcvhlwBPgcLooloA
         f7Bo3IznlofEUy9U5OXYgnwamF/lZBINFQbkTwj7lOZ+3z6axy0TLlJ9eGD8CcPUnAuo
         1u8fKIaecqobshVXhvh66EJEGOe6cTsN5G4GInwcARyp7aksZ/hhShC5+ogX+9+rj4nn
         fTt8pijI1/v2LGZOep/9/Uq3c5qO28jJC6bNrMuNpIkRf3PEi+DIyrcW2M9425AkUHav
         KXyjwogHX9TSQWRSjqTTWt2Pljk+Y6TdUSDNcBOeptw6Xs+/RABkyJWfXfqqZ4K/RIzB
         UhFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679497805;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WpIyrmn2yFb8HSkTpZJfQ2BkuEU1rXMevxKx3lamqmg=;
        b=Wg5uuUcQDGkdwX1vtnY4yrcbz+LI0u2cpgQAQNqPrmgfvjP8IHlrHym4+/5IZ97r/d
         hMAt2ewz6dilefy3CgnHdmvQvfNFTqqkxwwCyEnHdm/FRtNRgx1TGd/Vl0m+mrLY/yZg
         FjIPdn3YDaxI0hLs+M9+WK9g2M5z9rHUQ2yeQmiz25S/kHbbkdAquReLxjkhOGJG8KOV
         60OzzhVtdWi87Sej2aqaqTw9QJpiR0kn8/0q+tOyzHqk2UubmG1JMX8+bpQKqsReyuQV
         4udqjcehKK6tviepmGebbMq0KEr3GxTmEaJVqUwJm4NsL2VuH1fb4LshqyZMZaJXGLDB
         ZdJQ==
X-Gm-Message-State: AO0yUKUhk8S5UXTtIbBb1bu35tPIz0uHCqTF8gD3uJZ6WlDv6Y5cn2c5
	1w88MYt34Ht9OXTImjJNJWM=
X-Google-Smtp-Source: AK7set/+HAwc3ol55++pC5qAbN6sTJOLggPjQR56N/dbXUzk7LLWy8+z/QEw//cs0aJ/7eJAnJ9Y4w==
X-Received: by 2002:a17:906:2dd0:b0:932:c315:b0d with SMTP id h16-20020a1709062dd000b00932c3150b0dmr6794406eji.34.1679497804580;
        Wed, 22 Mar 2023 08:10:04 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id b1-20020a1709065e4100b008ca52f7fbcbsm7338533eju.1.2023.03.22.08.10.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 08:10:04 -0700 (PDT)
Date: Wed, 22 Mar 2023 18:09:50 +0300
From: Dan Carpenter <error27@gmail.com>
To: Khadija Kamran <kamrankhadijadj@gmail.com>
Cc: outreachy@lists.linux.dev,
	Parthiban Veerasooran <parthiban.veerasooran@microchip.com>,
	Christian Gromm <christian.gromm@microchip.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: most: fix line ending with '('
Message-ID: <8064a4ee-665b-417e-a1e2-7e7dd32ec1f0@kili.mountain>
References: <ZBsYYAc1Ue/JnUAm@khadija-virtual-machine>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZBsYYAc1Ue/JnUAm@khadija-virtual-machine>

On Wed, Mar 22, 2023 at 08:01:52PM +0500, Khadija Kamran wrote:
> Splitting function header to multiple lines because of 80 characters per
> line limit, results in ending the function call line with '('.
> This leads to CHECK reported by checkpatch.pl
> 
> Move the function parameters right after the '(' in the function call
> line. Align the rest of the parameters to the opening parenthesis.
> 
> Signed-off-by: Khadija Kamran <kamrankhadijadj@gmail.com>
> ---
> 
> Changes in v2:
>  - Changed the description
> 

No one replied to the v1 of this patch so it's not clear which of the
patches should be ignored.

Also you have a couple patches with the same subject and that's against
the rules.

regards,
dan carpenter

