Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FF0D65C
	for <linux-staging@lists.linux.dev>; Fri, 22 Mar 2024 04:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711083362; cv=none; b=jVMvZtSCPaWQw1dqWwuw8qx5DbNHxamN2/Si0mkumeGn6e/CokI8Ts0Dfw2tAgQnbzWtS4EEkBmTIgXLny2j6en+VXw3DN/27hmlPWjSFfPAnOLj7MD3nD6ob0MBJ9iYhXMrqK1L6Xw3FLCIDeH6rct+PUA9oPnlwi/59pMQ6ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711083362; c=relaxed/simple;
	bh=Ja8jMLT3LPTvUtMOHoywtBqZcuCcl4HSfbkfy+ne9mc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B1WMxBvtQF/vLLRz7zrGSwzusrdss6HcnkF+x1HdctEzuDMbSuhz+etqVwDI7Clf/gbRzuuvgtKzUetI8nG22mDnZqEcqJIf/8bxxrfuFibOmBebwPOgudhpBTqyKqPeSX3zrx6CfphFGdEUV9FmCEWAA+j1adxYnpE+UhjrHIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Kbz4I20g; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Kbz4I20g"
Received: from [192.168.1.105] (unknown [103.86.18.144])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A2F9882A;
	Fri, 22 Mar 2024 05:55:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1711083329;
	bh=Ja8jMLT3LPTvUtMOHoywtBqZcuCcl4HSfbkfy+ne9mc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Kbz4I20g/FrSXhjvScyw8p6YzNRHKtsiyeY8R3GkA1soITwdDkcRu1orCHhXztNcl
	 hFFHjmD7BfvseY7YNgd4CthGNTtOG44F8fg/XFCUE2rVjEbdL4w9kChF3uRJzG+vOU
	 HHpybRUU3Oeijt1z87ZEdi2uLKc0J7s8XBXK8w5Y=
Message-ID: <a6911446-cee4-4c17-9963-034e53275217@ideasonboard.com>
Date: Fri, 22 Mar 2024 10:25:49 +0530
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/6] staging: vc04_services: Drop global members for
 tracking connections
Content-Language: en-US
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-staging@lists.linux.dev, Stefan Wahren <stefan.wahren@i2se.com>,
 Dan Carpenter <error27@gmail.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Phil Elwell <phil@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, Greg KH <greg@kroah.com>
References: <20240321103740.808561-1-umang.jain@ideasonboard.com>
 <20240321103740.808561-5-umang.jain@ideasonboard.com>
 <20240321191259.GX9582@pendragon.ideasonboard.com>
From: Umang Jain <umang.jain@ideasonboard.com>
In-Reply-To: <20240321191259.GX9582@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Laurent,

On 22/03/24 12:42 am, Laurent Pinchart wrote:
> Hi Umang,
>
> Thank you for the patch.
>
> On Thu, Mar 21, 2024 at 04:07:38PM +0530, Umang Jain wrote:
>> Drop global members for tracking vchiq driver connections in
>> vchiq_connected.[ch] and use the struct vchiq_drv_mgmt to
>> track the connections.
> I'd write "Move global connection tracking to vchiq_drv_mgmt" in the
> subject line, as you're not just dropping them completely. Same in the
> commit message.
>
>> Also, store a vchiq_drv_mgmt pointer to struct vchiq_device to
>> have easy access to struct vchiq_drv_mgmt across vchiq devices.
>>
>> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
>> ---
>>   .../interface/vchiq_arm/vchiq_arm.c           |  2 +-
>>   .../interface/vchiq_arm/vchiq_arm.h           |  6 +++++
>>   .../interface/vchiq_arm/vchiq_bus.c           |  4 +++
>>   .../interface/vchiq_arm/vchiq_bus.h           |  3 +++
>>   .../interface/vchiq_arm/vchiq_connected.c     | 25 +++++++++----------
>>   .../interface/vchiq_arm/vchiq_connected.h     |  3 ++-
>>   6 files changed, 28 insertions(+), 15 deletions(-)
>>
>> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
>> index 01b4e4b010c6..ba096bcb32c8 100644
>> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
>> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
>> @@ -559,7 +559,7 @@ static int vchiq_platform_init(struct platform_device *pdev, struct vchiq_state
>>   	dev_dbg(&pdev->dev, "arm: vchiq_init - done (slots %pK, phys %pad)\n",
>>   		vchiq_slot_zero, &slot_phys);
>>   
>> -	vchiq_call_connected_callbacks();
>> +	vchiq_call_connected_callbacks(drv_mgmt);
>>   
>>   	return 0;
>>   }
>> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
>> index fc4122c27e94..1190fab2efc4 100644
>> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
>> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
>> @@ -23,6 +23,8 @@
>>   #define MAX_ELEMENTS 8
>>   #define MSG_QUEUE_SIZE 128
>>   
>> +#define VCHIQ_DRV_MAX_CALLBACKS 10
> It would be nice to remove this, but I think we can live with it for
> now.
>
>> +
>>   enum USE_TYPE_E {
>>   	USE_TYPE_SERVICE,
>>   	USE_TYPE_VCHIQ
>> @@ -35,6 +37,10 @@ struct vchiq_platform_info {
>>   struct vchiq_drv_mgmt {
>>   	struct rpi_firmware *fw;
>>   	const struct vchiq_platform_info *pinfo;
>> +
>> +	bool connected;
>> +	int num_deferred_callbacks;
>> +	void (*deferred_callback[VCHIQ_DRV_MAX_CALLBACKS])(void);
>>   };
>>   
>>   struct user_service {
>> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_bus.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_bus.c
>> index 68f830d75531..fb837e64838b 100644
>> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_bus.c
>> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_bus.c
>> @@ -54,6 +54,7 @@ static void vchiq_device_release(struct device *dev)
>>   struct vchiq_device *
>>   vchiq_device_register(struct device *parent, const char *name)
>>   {
>> +	struct platform_device *pdev;
>>   	struct vchiq_device *device;
>>   	int ret;
>>   
>> @@ -67,6 +68,9 @@ vchiq_device_register(struct device *parent, const char *name)
>>   	device->dev.dma_mask = &device->dev.coherent_dma_mask;
>>   	device->dev.release = vchiq_device_release;
>>   
>> +	pdev = to_platform_device(parent);
>> +	device->drv_mgmt = platform_get_drvdata(pdev);
> 	device->drv_mgmt = dev_get_drvdata(parent);
>
>> +
>>   	of_dma_configure(&device->dev, parent->of_node, true);
>>   
>>   	ret = device_register(&device->dev);
>> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_bus.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_bus.h
>> index 4db86e76edbd..b0e85ca2365e 100644
>> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_bus.h
>> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_bus.h
>> @@ -9,8 +9,11 @@
>>   #include <linux/device.h>
>>   #include <linux/mod_devicetable.h>
>>   
>> +#include "vchiq_arm.h"
>> +
> Use a declaration instead.
>
> struct vchiq_drv_mgmt;
>
>>   struct vchiq_device {
>>   	struct device dev;
>> +	struct vchiq_drv_mgmt *drv_mgmt;
>>   };
>>   
>>   struct vchiq_driver {
>> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.c
>> index 4604a2f4d2de..ec5e9107868e 100644
>> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.c
>> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.c
>> @@ -8,9 +8,6 @@
>>   
>>   #define  MAX_CALLBACKS  10
>>   
>> -static   int                        g_connected;
>> -static   int                        g_num_deferred_callbacks;
>> -static   void (*g_deferred_callback[MAX_CALLBACKS])(void);
>>   static   DEFINE_MUTEX(g_connected_mutex);
> Any reason not to move this to vchiq_drv_mgmt ?

yes, I looked into this - and it turned out the DEFINE_MUTEX 
implementation differs based on whether CONFIG_PREEMPT_RT is enabled or 
not, and I am not very sure if replacing it with struct mutex would have 
repercussions. I don't understand these bits very well yet and it seems 
(from a cursory look that DEFINE_MUTEX seems to be statically declared...)


>
>>   
>>   /*
>> @@ -21,21 +18,23 @@ static   DEFINE_MUTEX(g_connected_mutex);
>>    */
>>   void vchiq_add_connected_callback(struct vchiq_device *device, void (*callback)(void))
>>   {
>> +	struct vchiq_drv_mgmt *drv_mgmt = device->drv_mgmt;
>> +
>>   	if (mutex_lock_killable(&g_connected_mutex))
>>   		return;
>>   
>> -	if (g_connected) {
>> +	if (drv_mgmt->connected) {
>>   		/* We're already connected. Call the callback immediately. */
>>   		callback();
>>   	} else {
>> -		if (g_num_deferred_callbacks >= MAX_CALLBACKS) {
>> +		if (drv_mgmt->num_deferred_callbacks >= MAX_CALLBACKS) {
>>   			dev_err(&device->dev,
>>   				"core: There already %d callback registered - please increase MAX_CALLBACKS\n",
>> -				g_num_deferred_callbacks);
>> +				drv_mgmt->num_deferred_callbacks);
>>   		} else {
>> -			g_deferred_callback[g_num_deferred_callbacks] =
>> +			drv_mgmt->deferred_callback[drv_mgmt->num_deferred_callbacks] =
>>   				callback;
>> -			g_num_deferred_callbacks++;
>> +			drv_mgmt->num_deferred_callbacks++;
>>   		}
>>   	}
>>   	mutex_unlock(&g_connected_mutex);
>> @@ -46,17 +45,17 @@ EXPORT_SYMBOL(vchiq_add_connected_callback);
>>    * This function is called by the vchiq stack once it has been connected to
>>    * the videocore and clients can start to use the stack.
>>    */
>> -void vchiq_call_connected_callbacks(void)
>> +void vchiq_call_connected_callbacks(struct vchiq_drv_mgmt *drv_mgmt)
>>   {
>>   	int i;
>>   
>>   	if (mutex_lock_killable(&g_connected_mutex))
>>   		return;
>>   
>> -	for (i = 0; i <  g_num_deferred_callbacks; i++)
>> -		g_deferred_callback[i]();
>> +	for (i = 0; i <  drv_mgmt->num_deferred_callbacks; i++)
>> +		drv_mgmt->deferred_callback[i]();
>>   
>> -	g_num_deferred_callbacks = 0;
>> -	g_connected = 1;
>> +	drv_mgmt->num_deferred_callbacks = 0;
>> +	drv_mgmt->connected = true;
>>   	mutex_unlock(&g_connected_mutex);
>>   }
>> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.h
>> index e4ed56446f8a..0a3adefc69e0 100644
>> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.h
>> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.h
>> @@ -1,12 +1,13 @@
>>   /* SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause */
>>   /* Copyright (c) 2010-2012 Broadcom. All rights reserved. */
>>   
>> +#include "vchiq_arm.h"
> Structure declaration too.
>
>>   #include "vchiq_bus.h"
>>   
>>   #ifndef VCHIQ_CONNECTED_H
>>   #define VCHIQ_CONNECTED_H
>>   
>>   void vchiq_add_connected_callback(struct vchiq_device *device, void (*callback)(void));
>> -void vchiq_call_connected_callbacks(void);
>> +void vchiq_call_connected_callbacks(struct vchiq_drv_mgmt *mgmt);
>>   
>>   #endif /* VCHIQ_CONNECTED_H */

