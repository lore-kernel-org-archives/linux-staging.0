Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7DB57A
	for <linux-staging@lists.linux.dev>; Sun, 24 Apr 2022 09:48:03 +0000 (UTC)
Received: by mail-oi1-f181.google.com with SMTP id b188so13997331oia.13
        for <linux-staging@lists.linux.dev>; Sun, 24 Apr 2022 02:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NR9IcAf4zZ7TVMjsW1KdEsz3dFd7cHl2Hh7bXybUL2U=;
        b=mpfmbVoKuOqB1v7GbqmtgQmQm9XWZqwnPNkS8gpI5GQ55pmnrH8oe+FpMHDZm23m6O
         W1TQIDMzQUgc+KXv59n8mcdwKkwr4lq2n24/ePNScbJe/FItbOCNX5PdFkGoBfBEpsv0
         Q4SFy38RsMuKKRWSG/l+dTcplTBup0SdpVjHBx+PQmfrAKA4YpWOYRXdTJjcwLvr4qKY
         4u7SlFk+9zs00GGIgfzRtgXYymJCOZoCtrcD0sAWniVHwbw/4fJueyIgd1d4j28RkfVh
         oGSDnM79apC53b20BI3Lwrn6cbYg+87WFZ0APD5yhzX63/5E9lVERgiBglCdcFAzdHI0
         FPKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NR9IcAf4zZ7TVMjsW1KdEsz3dFd7cHl2Hh7bXybUL2U=;
        b=uHYICjX9sPskUHOobvlDL26+Teuv4KaXzVy7mgoxlgVYQEmb4q3HNJwxTBl2BfFd2w
         blgwQIoYP/XQxqXCCtx62k9kzEUjnrhAP8xP8S/WBQioakshG8G88kAP80d3kWt3ZBGT
         bcgxziDKHKPVMi5KT7vABG6hCtyRGlk+eF2xYQUNy92uOK5s4iLo2iVx0NFZtf7mOrKD
         +CMypz/ofvps0begvsRtfgyA7vQVhKL/JakRQ6iJhg2cr6mlDl3Z9G5vWvxpB6TfjLz9
         97joRrD898qD1hAvefm25UxrZUykOCaSnXu1HkDimdEdc3OI/2fP1H8i/Tgh6IBW+tJK
         rNdQ==
X-Gm-Message-State: AOAM531d2YM3c616iYPwiGEkC//++AVQcr/mCJSB2QJrR6ksFl7ElmIo
	2k8RGovl0POH0meByQ0XkLz3Q8uNVaXdaXQfTbc=
X-Google-Smtp-Source: ABdhPJyzpVb5ltwaTMr93ZjDy91prWkmEvZHBozs3ZJbbdW41m4CzE+CAzSLMA5Xy2TOBs8IKsNzTFerp04cMal8cTc=
X-Received: by 2002:aca:1306:0:b0:322:9104:6cf9 with SMTP id
 e6-20020aca1306000000b0032291046cf9mr5720845oii.112.1650793682840; Sun, 24
 Apr 2022 02:48:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220423184745.21134-1-makvihas@gmail.com> <3607997.MHq7AAxBmi@leap>
 <CAH1kMwSZbogptqDdiJVoiLcZamY_PmX_p0oXPZguoAnY=dibug@mail.gmail.com>
In-Reply-To: <CAH1kMwSZbogptqDdiJVoiLcZamY_PmX_p0oXPZguoAnY=dibug@mail.gmail.com>
From: Vihas Makwana <makvihas@gmail.com>
Date: Sun, 24 Apr 2022 15:17:52 +0530
Message-ID: <CAH1kMwTDaOgDFADR8OMWVOxg6pUmEAeprqOb_m6t3Tig-zOXgw@mail.gmail.com>
Subject: Re: [PATCH] staging: r8188eu: fix a potential NULL pointer dereference
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Cc: Larry Finger <Larry.Finger@lwfinger.net>, Phillip Potter <phil@philpotter.co.uk>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Michael Straube <straube.linux@gmail.com>, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Dan Carpenter <dan.carpenter@oracle.com>, Pavel Skripkin <paskripkin@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Please ignore this patch, Greg.
