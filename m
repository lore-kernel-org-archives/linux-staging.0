Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D24233F8C5
	for <linux-staging@lists.linux.dev>; Tue,  2 Jun 2026 21:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780435599; cv=none; b=kPlAnCqJNszODhNKJ+CZxeAwtYVefV58C/ziZ1ak/Mj5QJNh33+dezgJDpUns43mPBPxzN2gFfl3Wx0zBQuuzuz8C9ggfyjPISYDLbRlnlCFqwdEJwGVPK9qzLPYuDxa8ndHeWIHhR02i4XHKhcuJwCVWi+MvP5dJlkHlOj7si8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780435599; c=relaxed/simple;
	bh=Ox1ELZJ24GPPc4iQ29E+qdN0vT7PCHDXqBmRxrm/+h0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O+iBZLb0B8hFqxa5JTdLDX4b3LT5tWhTKXrmVn4H3RfCzGgxiNKSJZltsXIQJ+zwOAlI6IWLdsAodl7IxlvbK/f7/rbylQziAdcFfqnmKrYYCzQULHrvBu0lb/9FQvMg6TDWeZHOLfylBjFXhowOChkB/Q76422tHXKSRk6a/88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X3kIqA5d; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X3kIqA5d"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-45ef4223be7so2783143f8f.2
        for <linux-staging@lists.linux.dev>; Tue, 02 Jun 2026 14:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780435597; x=1781040397; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9FHosW3w9GqvYZ+Jb4OZm28+ohizyetvipE+8aMlroc=;
        b=X3kIqA5dAkdXJeuIpGwY3xJPS+fkjuUigAKByJVpL+a3d3UMUq95FpQWGEnatCGHuA
         AQWNkhgdzwVA1dieX+ktWz0rUvrXXr+cTOyl615Ja+GTulf+i/nvAHZMsv5yiwU5hPvL
         P/bFop9OBLFeBmAKYjrZCiQd8lLs2G1Vg5/nVMyYRXPjZ8jIdglP33WfrXSU+Q6hYkci
         kUIAMxM2JceAbfzA17bLag1ybqyTX62AR3BYiW8dUbO7jNnqdITLffECN8A74i0Av+4C
         R4wLm2epmzY94oxOA30aHEEIjdbeax/50NbarXMCe3Y3ECSSI6q1fURz8EKg4MirVlRW
         hA9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780435597; x=1781040397;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9FHosW3w9GqvYZ+Jb4OZm28+ohizyetvipE+8aMlroc=;
        b=N7sQbXoXs5gPdSkXcPOnINSU2VAQgMArrAycWWYgB6YjBw8qBW5s86QMliDm6YQe0V
         qceePdC8WNUo+qRMtLxeSJUHOFr7y8nndQ7L9lyPJGg06ruEQFfZV29K84IB49OcKFA8
         Thiqnxd8uxAVr9IwGrkBlmM0SXdpWcjdUdpPVkAUv/ri1j1gVNs8bynps/y4o/Pdf4Qy
         Njs3k2ORjkf9Oinjef8a5tTZy+bTZCuK7VmZG5hUlLPqK+0lApXGX9U+x8D2LgGPp8xK
         GY4xC92SearrHE3lTVhQ+dloBfW2ggrO0G04vXkq9yj8btWvHWMlCPGIm8GwsEdcOZoy
         RoJg==
X-Forwarded-Encrypted: i=1; AFNElJ+l+sr0f2/6J8dhq3hu0qYt4PFWJJPmL6xmcN0StXEgf02OaAOVi6EFIU+0Ii9u6s6n3xxhk3vC63VHa3VS@lists.linux.dev
X-Gm-Message-State: AOJu0Yw6DHPg8MfrUhKaO4ADgZhmpSwJPdk4L5q6F/EySvzVx4moTTu9
	SuN+/ZmWnGmp5YK/5ctahtvgn4PR/yF0o1/fQSdP7TmbJJDxHJNW/InQ
X-Gm-Gg: Acq92OEQWcbIIhgNddTbNXqTuAiejDyIWrTXwkgBwQNwRip7N75JLRGfbbcoySE8fNn
	fvsXvoLg73n/VGJypQnDu081c+EyTlV7nOOAcNQ+0aG/0a1FDbQ9/X3aCSl/xEplZhE6fVzLGNu
	QF2D/wrIoWNpAlwrDb8zkjBAdfKpN8iVJpybk5oJwC8NadGzjJFXHruCIQaysh5NsbnqGRHvKzr
	YiYMyY5LvhHywDCeCkActydmU5a7O1nnTePG2hwJLifYRaiMeHeGdx7CKUGST1kL2nAq7AHeSOr
	n7v1Ps0ON14r9ITsYZ9MQh1oWl0p9MhU0IGzMBANRq0DHaiHOAZy2Z0Md3RSeyPkp2c2K9Tacky
	VefBC7Ii9A1Vj21A7CNqJ2l14/iXhiVgAVRc4FvRDJ/NEbqxUTPqI4kE/ZSd6bQFlNg7eiW8YfF
	ybRr0hz3QUgKFUW0e/6pJ8qRLEFrxhOxIHQr32Duv6xSnY4jk=
X-Received: by 2002:a5d:5d0c:0:b0:460:1755:160e with SMTP id ffacd0b85a97d-460218724e1mr309695f8f.33.1780435596566;
        Tue, 02 Jun 2026 14:26:36 -0700 (PDT)
Received: from [192.168.0.7] ([86.124.200.154])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f360bd6sm2142515f8f.36.2026.06.02.14.26.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2026 14:26:36 -0700 (PDT)
Message-ID: <9372087b-82d6-43a2-bda2-02ba481fbf8c@gmail.com>
Date: Wed, 3 Jun 2026 00:26:35 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: axis-fifo: remove driver
To: Dan Carpenter <error27@gmail.com>, Grewstad <dogestad24@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux-staging@lists.linux.dev, Jacob Feder <jacobsfeder@gmail.com>
References: <20260602103208.15799-1-dogestad24@gmail.com>
 <ah7AYukZ5uzW1NVU@stanley.mountain>
 <CAD03fjZQwgvDbBdh6A=1FeGVn4Na29ww2DzG3anuk2sOd0-4EA@mail.gmail.com>
 <ah7Wn3-meqmDLk_d@stanley.mountain>
Content-Language: en-US
From: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
In-Reply-To: <ah7Wn3-meqmDLk_d@stanley.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 6/2/26 4:11 PM, Dan Carpenter wrote:
> On Tue, Jun 02, 2026 at 06:31:27PM +0530, Grewstad wrote:
>> On Tue, Jun 2, 2026 at 5:07 PM Dan Carpenter <error27@gmail.com> wrote:
>>>
>>> On Tue, Jun 02, 2026 at 04:01:53PM +0530, Arihan Bhor wrote:
>>>
>>> I don't think we should delete this driver.  From reading the git
>>> log, Ovidiu Panait was obviously using this code last year.  Let's
>>> also add Jacob Feder, although he hasn't touched the code in 8 years,
>>> he still might know if there are other users.
>>
>> I could not find any user-space applications that depend on this driver.
>>
>> https://lore.kernel.org/lkml/CAD03fjb=_kW9=q9YV4qnQ5GD=HMB5Bx7pf3+AFcgDR2gVc1V6Q@mail.gmail.com/
>> I was looking for any users of this driver on the linux-kernel, linux-staging,
>> and linux-arm-kernel mailing lists as well as Jacob Feder, and received no
>> replies since I posted it 1 day ago. If someone is using it or maintaining a
>> proprietary app, they will complain and we can bring the driver back.
> 
> Here are people using it and running into issues in Jan 2025.
> https://adaptivesupport.amd.com/s/question/0D54U00008zRBdISAW/vitis-is-not-creating-a-driver-entry-for-axififomm-43?language=zh_CN
> Someone provides a work around:
> https://adaptivesupport.amd.com/s/question/0D54U00008sLBuMSAW/how-to-use-the-axi-stream-fifo-drivers-xllfifoh-xllfifogc-etc-in-the-project?language=en_US
> Then Ovidiu Panait fixed the bug in Sep by adding the correct
> compatible.
> 

I was using this driver to play around with an FPGA board I have (Arty
Z7-20), so not for commercial purposes. This IP provides a convenient
way to move data to/from a custom IP in the FPGA. I am using it mostly
for testing.

I think there are no in-tree users mainly because the IP it talks to
lives in the FPGA fabric, and drivers for custom FPGA IP blocks
generally don't get upstreamed.

However, there is the problem of what subsystem this belongs to. It was
suggested to be turned into a DMA controller to get it moved out of staging:
https://lore.kernel.org/all/20260227-unboxed-customary-7ce6eda1858c@spud/

But I am not sure that this fits as a DMA controller, as it has no DMA
capabilities. The CPU moves every word individually to and from a register.

My understanding is that the real Xilinx dmaengine IP is
drivers/dma/xilinx/xilinx_dma.c and this IP is just a simpler, register
based alternative to move data between the CPU and the FPGA fabric.

Ovidiu

> regards,
> dan carpenter

