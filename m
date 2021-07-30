Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 972483481
	for <linux-staging@lists.linux.dev>; Fri, 30 Jul 2021 19:59:47 +0000 (UTC)
Received: by mail-oi1-f176.google.com with SMTP id a19so14763565oiw.6
        for <linux-staging@lists.linux.dev>; Fri, 30 Jul 2021 12:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=OnraWx5qTRp93j0CVIlVl1ZqO/lIu4qh2IAgjAxiQDs=;
        b=IruMxjxfiLT71vsNF66JLojpeerjaqTAoivTyp/iUBHvLcFqQEx77kv3MU0xFcGqW3
         ipl8uI4BgXeydJja5GHDU9U4VAqlejQuzJx+8iZOoiFTGXPdXfCL9v+vUKlamCf1/OVb
         +YzgeIUtxb3NNQnamiPM9727SykRFp2YgvRKWnDXT3aMT+3gka7/B1EMXpfjtank53Gm
         njBIJowD9Pel4Jw2LeQy/9RhHpscqw9/7eMkWja+gkLflmw4AlVgeghui7EA60Jze1g3
         4b/7JWMMJV6StelyN0YsyQ3hAdTCAKTsb9XjYqChRhZ8v7W7CFjmbzKq1sKYc/lMEtie
         1gXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:to:cc:from:subject:message-id:date
         :user-agent:mime-version:content-language:content-transfer-encoding;
        bh=OnraWx5qTRp93j0CVIlVl1ZqO/lIu4qh2IAgjAxiQDs=;
        b=VdXAbLxsyqe90aycCYZ9f21lw7BgFGra1jZTngKNoI635wfib7piMmXZazhlWUnSKO
         UOFKnedP9DajdUGLJEMIMXGyeQ9F7ocjUIAqGYuC+b/HAmU01gTzMM9+WEU0EMIy4GlB
         aHYfk2aE8RiR3FCXijaPLEnPGNrFUylVyM/dPhgE7nLdmokawRVpOjh0h9PMYs5fy0GN
         sZgXEml8nHN0LCsu4AxoXkjy+ZiJ6L+odQ/yF639xCxM8yehiWbJVj8BGSK1NjqcedPx
         0ANagdrmE7fI7ZOO4sB3lDa0wt49uqLkIdttld7sZiVeIhaDda6HhUHxAu1ltXaVuWQ5
         hf9Q==
X-Gm-Message-State: AOAM5312RyZvS6MSNsR7XI452vZeQs79Exnnm5R2y1cE+m+UiAC9U8Pi
	yfQY7TittRM/TaY4HWInye9efJ1qe4I=
X-Google-Smtp-Source: ABdhPJxYHmxzycgXU2OiG+lfvIa8PNJ/DaLWgwgJ1CxCwYmReUqVyCq/RkJmeKF0xbNGU7ytQrKS3w==
X-Received: by 2002:a54:4817:: with SMTP id j23mr3052561oij.59.1627675186547;
        Fri, 30 Jul 2021 12:59:46 -0700 (PDT)
Received: from 2603-8090-2005-39b3-0000-0000-0000-100a.res6.spectrum.com (2603-8090-2005-39b3-0000-0000-0000-100a.res6.spectrum.com. [2603:8090:2005:39b3::100a])
        by smtp.gmail.com with ESMTPSA id e3sm403155oow.34.2021.07.30.12.59.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jul 2021 12:59:45 -0700 (PDT)
Sender: Larry Finger <larry.finger@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>, linux-staging@lists.linux.dev
From: Larry Finger <Larry.Finger@lwfinger.net>
Subject: kernel BUG in new r8188eu
Message-ID: <80042e9f-6811-38f3-010b-1c0951ba88db@lwfinger.net>
Date: Fri, 30 Jul 2021 14:59:44 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Greg,

When I unplug the USB device with the driver loaded, I get the following BUG and 
my laptop freezes:

kernel: BUG: unable to handle page fault for address: ffffeb0200043248
kernel: #PF: supervisor read access in kernel mode
kernel: #PF: error_code(0x0000) - not-present page

The traceback points to a kfree() call. I do not understand this BUG. Can you 
explain what happens?

I think I know how to avoid the BUG, but that might be at the expense of a 
memory leak.

Thanks,

Larry
