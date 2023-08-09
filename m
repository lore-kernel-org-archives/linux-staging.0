Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75BCF24518
	for <linux-staging@lists.linux.dev>; Wed,  9 Aug 2023 20:09:47 +0000 (UTC)
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-56d6dfa1f3cso190438eaf.0
        for <linux-staging@lists.linux.dev>; Wed, 09 Aug 2023 13:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691611786; x=1692216586;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=F+guNxHUje3lymS48k+nwBpzTKa7bGAQuVmk1BhhlZk=;
        b=K9Y7e2sgUD63V7qyabdp/c3ek8LxXZ4HDsKpcmrSDO1lsYxzQ7E8Fnnp6JZKwGEpsQ
         1vyqMH00Q6lcvDX/Kzz5RM5FWzfhXJwtGaKfhhK44e6VQKYVXjQXSmgHYcVzZHF3MIhU
         vVBt6RY6k4v13HpNrCS7Me7qCCe7zeLKJIufmtTtv1+JGAkt3W74G6g45mGGZeYZa8PV
         oa9ol5VUaBTrByF4M9B0gxL5DawTdkP6MgP1nr6MUz/3KDwSSeOtr3/Pwow1V+QtGD77
         S7NRZGufnRPZMAbW4mi5PpGuX421ouypNdcRGPAL2wlKPYT70OcjjTdBWq9kcFGo+fp0
         +pPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691611786; x=1692216586;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F+guNxHUje3lymS48k+nwBpzTKa7bGAQuVmk1BhhlZk=;
        b=ORpkf8uD6aqrHaw/z6Iia6/NrnIqjILzkOxHiovf1h/s6N1HlGczOkcjzJ28kFVB5h
         vovZL3Ii8z7lm75uaO7/DQX7QlJfsoiskeMlGu9LrVVS/Qt+cFzyS8d7b8Zm2/uvC4nb
         8IkAZP5Kr8FNmUnxjlsN+IQYf96yzWE+pGv6MuTrMBUldcbtwyjAMa2cXid7q5V1npwX
         0Ri/aUxoBkfISTw7ULz1KEKcgm7wPemSiZxOoD2FBn4Jr5TJadGWF7/OhDrYTTqeRwME
         Dxmd238AykagBoClQ0BxRcgyqaiQcRYSQNV+Ye44UeRUJoKThNZZLQvEIRdp+3xt5DtS
         B3qg==
X-Gm-Message-State: AOJu0YwZ2dOppGk/9Spxr6CERF9A9Q+jeF0jLPDvztzil0OSX9LuUEuX
	p1nhikgoaRkenmlZmDi9JJUczmkOJQg=
X-Google-Smtp-Source: AGHT+IH8tOSf0R57BpEPXZz2hqXb84k0sxHYie+rlNmtEDYZYrLz3ZtYaCnp96AJqgoW60Ws5oSKWA==
X-Received: by 2002:a4a:274b:0:b0:56c:dce3:ce89 with SMTP id w11-20020a4a274b000000b0056cdce3ce89mr258142oow.5.1691611786223;
        Wed, 09 Aug 2023 13:09:46 -0700 (PDT)
Received: from alolivei-thinkpadt480s.gru.csb ([2804:14c:bf20:86d6:7871:f7e9:8a15:865a])
        by smtp.gmail.com with ESMTPSA id 125-20020a4a1183000000b00565fcfabab8sm7247008ooc.21.2023.08.09.13.09.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Aug 2023 13:09:45 -0700 (PDT)
Date: Wed, 9 Aug 2023 17:09:40 -0300
From: Alexon Oliveira <alexondunkan@gmail.com>
To: Nam Cao <namcaov@gmail.com>
Cc: gregkh@linuxfoundation.org, martyn@welchs.me.uk,
	manohar.vanga@gmail.com, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v3] staging: vme_user: fix alignment of open parenthesis
 and deleted trailing spaces
Message-ID: <ZNPyhNbl5mEbGxR+@alolivei-thinkpadt480s.gru.csb>
References: <ZNJKTLZ62SZMM6D8@alolivei-thinkpadt480s.gru.csb>
 <ZNOizFnDXojT4s85@nam-dell>
 <ZNO8XmOpylyE0AWS@alolivei-thinkpadt480s.gru.csb>
 <ZNPoSCriq7MYOLlc@nam-dell>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZNPoSCriq7MYOLlc@nam-dell>

On Wed, Aug 09, 2023 at 09:26:00PM +0200, Nam Cao wrote:
> On Wed, Aug 09, 2023 at 01:18:38PM -0300, Alexon Oliveira wrote:
> > There was indeed and accident commit modifying more than one line in my
> > tree, hence the "trailing whitespaces" messages in one of the commits.
> > So, to clean evertyhing up, I decided to drop these commits and start
> > all over again, from scratch. That way I'm sure I'm not messing up
> > anything else. I just sent a fresh patch in another thread.
> 
> FYI just in case you are new with git, you can always work on different stuffs
> in different git branches. No need to delete your previous works, just create a
> new fresh branch.
> 

ACK, thank you for the tip. I'm not new with git, but I'm indeed new
using git to contribute do kernel. I'm still learning my way through
the steps needed to adhere to the community procedures.

In this case, I preferred to start from scratch because I'm using this
branch only for this type of stuff, and I'm going to use different
branches for different purposes.

> Best regards,
> Nam

Thank you.

Alexon Oliveira
