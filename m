Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E50FA6D13
	for <linux-staging@lists.linux.dev>; Sun, 11 Apr 2021 18:12:28 +0000 (UTC)
Received: from localhost.localdomain ([37.4.249.124]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MGzI3-1lHa5j0XVj-00E4VF; Sun, 11 Apr 2021 20:12:24 +0200
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: linux-staging@lists.linux.dev,
	Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH 04/10] staging: vchiq_core: Exit early in 2 functions
Date: Sun, 11 Apr 2021 20:11:34 +0200
Message-Id: <1618164700-21150-5-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1618164700-21150-1-git-send-email-stefan.wahren@i2se.com>
References: <1618164700-21150-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:nrN/IiNHe2WAjB1kblb3p4Dhij2ba8huDGtNiMyG269LGUI2zdV
 Yb+3EaZHZznRDpI1RuIUUuwzUXNtFPkfT26Mj4RPaShydE0zlMuzF0jzivK3uhXZZfKiBcu
 V7FhMTVASw5yhdqOE/RBqWvHcjt1+Qsx16DLHEs0jspOtLczt6EKXjh13j7d19Omi74XMCT
 rZJ4zuvuZ9pjUO2MM4uPA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:eDy/nEEv1W0=:OoXiGIWsAk4xyNdQYR4WTV
 EyiJ+YCKtDMofsz/JMSjMqPqvQX0zqRvq798ORa6TX56VKsfYr10VwyPFsxOvLlle7XpGzeog
 xFEcrghi64f+PT5nZ/tfPdlw/qxs+uPYZpggzIzf6cr1r76HKIduhl+8quBrWM/N7UK4IUu5w
 CU7ZocPvwbpsh85fWfPlXQ1pYsUkOhoZi7a5CjERNeFqh5zv6hhr8hFBnl1EgItUEmUjIHUHp
 km4V9686aNsx/wOc34TAwx0+8mRtNzBVjA3lsB6BR4hvAUN7qTFXXRhQ4DPKC1RnWmulCbIof
 UM9Wq9DtByVACn9m1h1uVfuamm0b6TS3WoLxYJ7P4LSsERKPmNhiZ5TbjvjK8qXRiIaCLLxcW
 9PyKcJMJ33+m3hHjPrrgYYpXVyk+WaFPJcoxMi2AelKw/XTkjZNJ90Jc2wajBBxqDd0DYu/ya
 iJSn1Z6tKIC4kUuWaCA9lHvgwK30mtF2RsojQIQE4kCDVyaDVkKy
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

Exit early allow us to reduce the indention in vchiq_open_service_internal()
and vchiq_set_service_option(). Btw we can avoid the multi-line assignments
of quota.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 .../vc04_services/interface/vchiq_arm/vchiq_core.c | 151 ++++++++++-----------
 1 file changed, 74 insertions(+), 77 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index 835f2a5..e67ba54 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -2525,24 +2525,27 @@ vchiq_open_service_internal(struct vchiq_service *service, int client_id)
 			       &payload,
 			       sizeof(payload),
 			       QMFLAGS_IS_BLOCKING);
-	if (status == VCHIQ_SUCCESS) {
-		/* Wait for the ACK/NAK */
-		if (wait_for_completion_interruptible(&service->remove_event)) {
-			status = VCHIQ_RETRY;
-			vchiq_release_service_internal(service);
-		} else if ((service->srvstate != VCHIQ_SRVSTATE_OPEN) &&
-			   (service->srvstate != VCHIQ_SRVSTATE_OPENSYNC)) {
-			if (service->srvstate != VCHIQ_SRVSTATE_CLOSEWAIT)
-				vchiq_log_error(vchiq_core_log_level,
-						"%d: osi - srvstate = %s (ref %u)",
-						service->state->id,
-						srvstate_names[service->srvstate],
-						kref_read(&service->ref_count));
-			status = VCHIQ_ERROR;
-			VCHIQ_SERVICE_STATS_INC(service, error_count);
-			vchiq_release_service_internal(service);
-		}
+
+	if (status != VCHIQ_SUCCESS)
+		return status;
+
+	/* Wait for the ACK/NAK */
+	if (wait_for_completion_interruptible(&service->remove_event)) {
+		status = VCHIQ_RETRY;
+		vchiq_release_service_internal(service);
+	} else if ((service->srvstate != VCHIQ_SRVSTATE_OPEN) &&
+		   (service->srvstate != VCHIQ_SRVSTATE_OPENSYNC)) {
+		if (service->srvstate != VCHIQ_SRVSTATE_CLOSEWAIT)
+			vchiq_log_error(vchiq_core_log_level,
+					"%d: osi - srvstate = %s (ref %u)",
+					service->state->id,
+					srvstate_names[service->srvstate],
+					kref_read(&service->ref_count));
+		status = VCHIQ_ERROR;
+		VCHIQ_SERVICE_STATS_INC(service, error_count);
+		vchiq_release_service_internal(service);
 	}
+
 	return status;
 }
 
@@ -3359,74 +3362,68 @@ vchiq_set_service_option(unsigned int handle,
 	enum vchiq_status status = VCHIQ_ERROR;
 	struct vchiq_service_quota *quota;
 
-	if (service) {
-		switch (option) {
-		case VCHIQ_SERVICE_OPTION_AUTOCLOSE:
-			service->auto_close = value;
-			status = VCHIQ_SUCCESS;
-			break;
+	if (!service)
+		return VCHIQ_ERROR;
+
+	switch (option) {
+	case VCHIQ_SERVICE_OPTION_AUTOCLOSE:
+		service->auto_close = value;
+		status = VCHIQ_SUCCESS;
+		break;
 
-		case VCHIQ_SERVICE_OPTION_SLOT_QUOTA:
-			quota = &service->state->service_quotas[
-					service->localport];
-			if (value == 0)
-				value = service->state->default_slot_quota;
+	case VCHIQ_SERVICE_OPTION_SLOT_QUOTA:
+		quota = &service->state->service_quotas[service->localport];
+		if (value == 0)
+			value = service->state->default_slot_quota;
+		if ((value >= quota->slot_use_count) &&
+		    (value < (unsigned short)~0)) {
+			quota->slot_quota = value;
 			if ((value >= quota->slot_use_count) &&
-				 (value < (unsigned short)~0)) {
-				quota->slot_quota = value;
-				if ((value >= quota->slot_use_count) &&
-					(quota->message_quota >=
-					 quota->message_use_count)) {
-					/*
-					 * Signal the service that it may have
-					 * dropped below its quota
-					 */
-					complete(&quota->quota_event);
-				}
-				status = VCHIQ_SUCCESS;
-			}
-			break;
+			    (quota->message_quota >= quota->message_use_count))
+				/*
+				 * Signal the service that it may have
+				 * dropped below its quota
+				 */
+				complete(&quota->quota_event);
+			status = VCHIQ_SUCCESS;
+		}
+		break;
 
-		case VCHIQ_SERVICE_OPTION_MESSAGE_QUOTA:
-			quota = &service->state->service_quotas[
-					service->localport];
-			if (value == 0)
-				value = service->state->default_message_quota;
+	case VCHIQ_SERVICE_OPTION_MESSAGE_QUOTA:
+		quota = &service->state->service_quotas[service->localport];
+		if (value == 0)
+			value = service->state->default_message_quota;
+		if ((value >= quota->message_use_count) &&
+		    (value < (unsigned short)~0)) {
+			quota->message_quota = value;
 			if ((value >= quota->message_use_count) &&
-				 (value < (unsigned short)~0)) {
-				quota->message_quota = value;
-				if ((value >=
-					quota->message_use_count) &&
-					(quota->slot_quota >=
-					quota->slot_use_count))
-					/*
-					 * Signal the service that it may have
-					 * dropped below its quota
-					 */
-					complete(&quota->quota_event);
-				status = VCHIQ_SUCCESS;
-			}
-			break;
-
-		case VCHIQ_SERVICE_OPTION_SYNCHRONOUS:
-			if ((service->srvstate == VCHIQ_SRVSTATE_HIDDEN) ||
-				(service->srvstate ==
-				VCHIQ_SRVSTATE_LISTENING)) {
-				service->sync = value;
-				status = VCHIQ_SUCCESS;
-			}
-			break;
-
-		case VCHIQ_SERVICE_OPTION_TRACE:
-			service->trace = value;
+			    (quota->slot_quota >= quota->slot_use_count))
+				/*
+				 * Signal the service that it may have
+				 * dropped below its quota
+				 */
+				complete(&quota->quota_event);
 			status = VCHIQ_SUCCESS;
-			break;
+		}
+		break;
 
-		default:
-			break;
+	case VCHIQ_SERVICE_OPTION_SYNCHRONOUS:
+		if ((service->srvstate == VCHIQ_SRVSTATE_HIDDEN) ||
+		    (service->srvstate == VCHIQ_SRVSTATE_LISTENING)) {
+			service->sync = value;
+			status = VCHIQ_SUCCESS;
 		}
-		unlock_service(service);
+		break;
+
+	case VCHIQ_SERVICE_OPTION_TRACE:
+		service->trace = value;
+		status = VCHIQ_SUCCESS;
+		break;
+
+	default:
+		break;
 	}
+	unlock_service(service);
 
 	return status;
 }
-- 
2.7.4

