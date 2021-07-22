Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B5CA168
	for <linux-staging@lists.linux.dev>; Thu, 22 Jul 2021 16:31:03 +0000 (UTC)
Received: by mail-oi1-f172.google.com with SMTP id y66so7188732oie.7
        for <linux-staging@lists.linux.dev>; Thu, 22 Jul 2021 09:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=nJqt6aEQhJ62kc2f84CwMWQhZV90rGzZxRgH8SmsqLI=;
        b=qWxhII5/AehtZWRzLBrt0mFlbuJGS2yIl8FlQgcEMued+EsnNnDCzpPof1z0xUAshW
         9S0X1Va2T8ao9zX4eNLH7ZsQ84YlEu76mnoG/BLP8fkqTd/iCSxiWV1iMRpgVj9pbWnD
         Y/GJcsO+hZgLH99pu7eJDftIZ5ZwkP7rxeua7Pu+e/sKTcriOm1iP2btX7jKeURPLOYB
         PA1hUmcUyRW3H5GZmjCjbOz/TXvB5iCAkHk9jWMtW6278op7//4wOkuHg7P/n7KBF4BF
         Wz+Kn9qmzwKh00HhEEfnfNuU829hC/JpMWE+T+WUHbXE3eNEwR6i0OGHZJp6RokJaZbO
         hYRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=nJqt6aEQhJ62kc2f84CwMWQhZV90rGzZxRgH8SmsqLI=;
        b=GGYCiBFjnErbQ0CVkC+ypjpd+D4Pm0T0BibG7/+/mGAojEJ/CfWIagchQMk2DmGdQO
         zShu0zmnaV1M0vQ2YvHYa0KzwqxE+bu8/NWPo1xpK3sELKAkXEJObLvtExbyQVInAYZv
         JQwmNgWGyTqoa/xPLbqzlDfJsh0+aZQVViK1pglTv67RkxXfX+qt+m0pqzSk3Z9GYpwV
         7jCVxoMk+hxTIrtqpiKZV/c/9l04BhODOTpGTyTqk1TMHgz1c8brNpuQN82n0JEjpIFa
         qzBknBElvrBufpC+ycuEgWulKaASWAn5p/w2l9TCss0Xcbzd8uDjC4960z9vK/tJT8MM
         3Kmg==
X-Gm-Message-State: AOAM530sSu+PoLRV4fJctiV8bw75XySL5KL+4ZkAfe2HuLXlamM7/ZNb
	rS28RzMe2yTZGEEDilqLPYg=
X-Google-Smtp-Source: ABdhPJxUicCRZgtL6n1yZmKF06mBJmZ0HR3rAWAfzPvGyrl9ywrK0YKK3vufu56JAxSZMuRHJjd5QA==
X-Received: by 2002:aca:4256:: with SMTP id p83mr6104569oia.70.1626971462350;
        Thu, 22 Jul 2021 09:31:02 -0700 (PDT)
Received: from localhost.localdomain (cpe-24-31-246-181.kc.res.rr.com. [24.31.246.181])
        by smtp.gmail.com with ESMTPSA id t141sm4887442oot.40.2021.07.22.09.31.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jul 2021 09:31:01 -0700 (PDT)
Sender: Larry Finger <larry.finger@gmail.com>
Subject: Re: [PATCH resend] staging: rtl8188eu: move all source files from
 core subdirectory
To: Greg KH <gregkh@linuxfoundation.org>,
 Phillip Potter <phil@philpotter.co.uk>
Cc: Dan Carpenter <dan.carpenter@oracle.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-staging@lists.linux.dev, Fabio Aiuto <fabioaiuto83@gmail.com>
References: <20210719224601.255364-1-phil@philpotter.co.uk>
 <7bc43fb0-2dab-190b-c480-9e77cff863d4@lwfinger.net>
 <20210720090035.GB1406@agape.jhs>
 <08a8b372-8ec2-afcc-cc54-305d1dd74a59@lwfinger.net>
 <YPfRf8dgFd+u5hzm@equinox>
 <0c2d97fa-e1e1-3564-98b8-37d5b9a1a9cb@lwfinger.net>
 <20210721182836.GX1931@kadam>
 <ed7b7d93-f754-dce9-ca4f-425e49c972ba@lwfinger.net>
 <CAA=Fs0nvhxEhJhCTWH_KkYyB3Jz7Pi-t2a+6zL3K=O-_3-sLGg@mail.gmail.com>
 <YPlyZsuRJpkUwWiJ@kroah.com>
From: Larry Finger <Larry.Finger@lwfinger.net>
Message-ID: <e91cf326-f393-4ad5-568a-dbdd7cc759db@lwfinger.net>
Date: Thu, 22 Jul 2021 11:30:59 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <YPlyZsuRJpkUwWiJ@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 7/22/21 8:28 AM, Greg KH wrote:
> If the code looks "better", I have no objection to just adding it to
> drivers/staging/ and deleting the existing one here, so that everyone
> can work on this together in one single place.
> 
> Larry, any objection to that?

I am not opposed to that. Do you want me to supply the new driver as a set of 
patches, or would someone else like to do it?

Larry

