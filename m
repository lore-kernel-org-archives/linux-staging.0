Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44BAF70
	for <linux-staging@lists.linux.dev>; Sun,  6 Jun 2021 06:49:55 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id my49so4519497ejc.7
        for <linux-staging@lists.linux.dev>; Sat, 05 Jun 2021 23:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8ygb6AseoKvTeCmuWez+WnMGc8cXkovwO+NvwpnOyNU=;
        b=DLFo/uw/u59+/GZfoZm7PytLFoWU7BT7lunqz3zydjjAwIJtL1w2LGNHyBlVjBF7pH
         EGdExU+z1KFhOqmcQOXKcSUekfFp0CSwtY0V1paAH7UowbsQxm66dEbvbqKrkpjVs7Bi
         QYmH87j2EkLIYGenqEpdomj18vDwGGpItrLc8a5cdo68nyo4RWtMIVwZw+HKHfzDz3LS
         eO37aUX3rrUXVqx4qa4sZCA/VVDQVtq8666hOfbucOWeCR+I80xLTvOKXroDJW+KzZ/E
         4QFzd1GICMDTTMKxJ++m7NbgIO4L+nviSr8LsulzxnkqemUHHK3nN2cE7TLJyC73Ty4d
         FN3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8ygb6AseoKvTeCmuWez+WnMGc8cXkovwO+NvwpnOyNU=;
        b=PNuKWMtxfQ9SS9YdnmG7XfCPm0q2UV0o6AOzrBCEonCgAoCNXcGto06llHUB0CUqAp
         oTaAv10PRVD4f3+99DU/KzE87oU3MggFeRxEagQUcLJHI71ye9qjEKgIVVWjw+p0kZuA
         6EVbKkvv5Jgf9hBrUlqtvzDcKh6qCPQiWkP0ExPbCKHP4hrc8/OiyI9EtkE5BbYawkoD
         3m654EE9QwaxtG3BpYw780vRWebjE7OfsefK5yzxCw3E83KAg4sfVDpqwpk/C55cplOB
         mNJMAIeUPV+crCosFi2giRksJFd2/R4mljC4AvMRdambpwnqm2tE3p972O9CkYsfqb4Y
         xxRA==
X-Gm-Message-State: AOAM532hAiusOCRdNyNPQgZ2nJDO7dBZ2UxXZzR/Tzw0zo+lrX8xqZN4
	s/As/0cuzSA6RZRtGlIjZR8=
X-Google-Smtp-Source: ABdhPJyew04RSuj0qQbnLfXk1PKEjvCEyBd4wxSa0o0QDjZ4We6m3QED0N5nZWSEwENe+cSdXj6+xA==
X-Received: by 2002:a17:907:1c9e:: with SMTP id nb30mr3748001ejc.0.1622962193840;
        Sat, 05 Jun 2021 23:49:53 -0700 (PDT)
Received: from linux.local (host-82-59-55-132.retail.telecomitalia.it. [82.59.55.132])
        by smtp.gmail.com with ESMTPSA id x4sm5876751edq.23.2021.06.05.23.49.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jun 2021 23:49:53 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Joe Perches <joe@perches.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: os_dep: Remove conditions with no effects
Date: Sun, 06 Jun 2021 08:49:52 +0200
Message-ID: <4661119.G1Uu3eHz2z@linux.local>
In-Reply-To: <1c87140c6e580b443de5d4abafb7872c8ee3efef.camel@perches.com>
References: <20210606043552.31785-1-fmdefrancesco@gmail.com> <1c87140c6e580b443de5d4abafb7872c8ee3efef.camel@perches.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="ISO-8859-1"

On Sunday, June 6, 2021 7:56:32 AM CEST Joe Perches wrote:
> On Sun, 2021-06-06 at 06:35 +0200, Fabio M. De Francesco wrote:
> > Removed conditions with no effects. Detected by Coccinelle.
> 
> It's be good if you researched how this came to be and noted it
> in the changelog.
> 
> try:
> 
> commit dc365d2cc579200bc3752ddb941e046e3a16962c
> Author: Fabio Aiuto <fabioaiuto83@gmail.com>
> Date:   Tue Mar 16 15:04:11 2021 +0100
> 
>     staging: rtl8723bs: remove unused code blocks conditioned by never set
> CONFIG_AP_WOWLAN
>
I've just read the commit you pointed out. It seems that the conditions with 
no effects came out while removing code that was conditionally compiled by the 
unused definition CONFIG_AP_WOWLAN.

However, I don't understand why those "conditions with no effects" have been 
left there. 

Now I'm not sure of what you asked me to do: should I leave them there as they 
are (perhaps because I missed something) or should I explain in my patch that 
they were overlooked by commit dc365d2cc579?

Thanks in advance,

Fabio



