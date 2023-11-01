Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D9745679;
	Wed,  1 Nov 2023 08:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GPT9B8/C"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1cc3bb4c307so24517055ad.0;
        Wed, 01 Nov 2023 01:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698826483; x=1699431283; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yteGal8bfi28CjXQ5f/6gEYfH3Je8xJWZgC19fKPZpw=;
        b=GPT9B8/CVtJ23y8Ow9CPinv92OhqQ0ekAEX0/Su+1d2j0YsczNBlcNW+aKCx5AuIhE
         ET/BV0cUcQn/5QPZnhluKm80YP0XaqI45k7kPKJldaV7EjmNjGykuT8PrWUqZGwAgLLV
         DT9WxOQIwxjim20oxouyPpeAlQveUPKk1NfO0FSg5FBAMUX+5ff/kQq3Ss9YpF6Suoa9
         bXDJ7QFV/h21h3yu8cSIGEAhuqt5QrW2w+MbhHP8/tOZqzhOtJytqbRuUQZrOU+z71qp
         MIXvv5JF657Lyz5s7kzjyznrOAL4EE6QXgTwr/OvP9akwJQGqdCfXBlGI3VQF6NDUpLi
         iMQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698826483; x=1699431283;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yteGal8bfi28CjXQ5f/6gEYfH3Je8xJWZgC19fKPZpw=;
        b=TrSWRY8YW16sIevIf6xC+eo6R2GIxiNoS03NSaxpBlFlj/9+McYH4OuDXyUy3HqVPf
         YlK6htAR6rTlxYSX/e4N77vToyx54W7eZ66TUkckZwlAXz6VbhLi3ckp1y5/TCpK4xt1
         bWoRrcS8NY9l2Dz4Uy9/TkRI4Or+T14dQ94xtB2LoZATRGa1zYoRX1XhtG1O3DKYpaKB
         JFgI+5nyEZEfyLiSrVk/tqOPoAF3c8O5sAgvmdRl1HSjWj4YQE9CO2A9PdChsRK2WQs2
         V/gdeIJi80VAizkuMRdDltom242Qcgl89sf2uLgLwwir6XUfk11hMYFRFc90OC+NeQ3z
         MieQ==
X-Gm-Message-State: AOJu0Yw0VdlAK9uFU+lM3raNdXc4IilLvqsaHX7YjTxnewbpZjez0jR+
	KqjNPeoHNKveVbxKGZQMmHg=
X-Google-Smtp-Source: AGHT+IEvDkDlJewlEieY2zSy9jhj4YYYdNBvwZXNulDhgLueNtBCUcYWG/kgUcekigFT/lm+sJXHPw==
X-Received: by 2002:a17:903:905:b0:1c8:90bf:4239 with SMTP id ll5-20020a170903090500b001c890bf4239mr10564511plb.42.1698826483425;
        Wed, 01 Nov 2023 01:14:43 -0700 (PDT)
Received: from [192.168.0.106] ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id o11-20020a170902bccb00b001c0a414695bsm821596pls.43.2023.11.01.01.14.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Nov 2023 01:14:43 -0700 (PDT)
Message-ID: <ae8cc9af-b73c-435e-b2fe-8930c49e88bd@gmail.com>
Date: Wed, 1 Nov 2023 15:14:38 +0700
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: vme: enhance the help paragraphs for clarity
Content-Language: en-US
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Dorine Tipo <dorine.a.tipo@gmail.com>,
 Linux Outreachy <outreachy@lists.linux.dev>,
 Linux Staging Drivers <linux-staging@lists.linux.dev>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Martyn Welch <martyn@welchs.me.uk>, Manohar Vanga <manohar.vanga@gmail.com>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>, Charles Han <hanchunchao@inspur.com>
References: <20231029180346.8570-1-dorine.a.tipo@gmail.com>
 <ZUIAyQGSfIKqK7AE@debian.me> <2023110152-snack-circle-3bf9@gregkh>
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <2023110152-snack-circle-3bf9@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01/11/2023 15:09, Greg KH wrote:
> On Wed, Nov 01, 2023 at 02:39:53PM +0700, Bagas Sanjaya wrote:
>> [Cc'ing driver contributors found via get_maintainer.pl. Also Cc: Charles from
>> linux-doc mailing list as wording patches like this one most likely suit him.]
> 
> Please do not, that's the responsibility of the outreachy applicant to
> do, as it is documented very well what needs to happen here.
> 

OK, thanks!

-- 
An old man doll... just what I always wanted! - Clara

